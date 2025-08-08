<?php

namespace app\admin\controller\ldcms;

use fast\Http;
use ZipArchive;
use think\Cache;
use think\Config;
use think\Exception;
use think\addons\Service;
use addons\ldcms\utils\ThemeService;
use addons\ldcms\model\Langs;

class Themes extends Base
{
    public function index()
    {
        //当前是否为关联查询
        $this->relationSearch = false;
        //设置过滤方法
        $this->request->filter(['strip_tags', 'trim']);
        if ($this->request->isAjax()) {
            /*获取模板*/
            $themes = ThemeService::getThemeList();
            /*获取语言*/
            $langsModel = new Langs();
            $langs = $langsModel->getList();
            
            /*获取语言对应使用的模板*/
            $langtheme = [];
            foreach ($langs as $lk => $lang) {
                $langconfig = ld_get_site_config($lk, true);
                if (!empty($langconfig) && !empty($langconfig['template'])) {
                    $langtheme[$langconfig['template']] = ['template' => $langconfig['template'],'key' => $lk,'text' => $lang];
                }
            }
            $list = [];
            foreach ($themes as $k => $v) {
                if ($v['install'] == 0) {
                    $v['thumb'] = '/assets/addons/ldcms/admin/img/noinstall.png?v='.time();
                } else {
                    $v['thumb'] = '/assets/addons/ldcms/admin/img/'.$v['thumb'];
                }
                
                // 初始化状态
                $v['state'] = 0;
                $v['lang_text'] = '';
                $v['lang'] = '';
                
                /*判断模板是否被使用 并获取使用模板的语言*/
                foreach ($langtheme as $lk => $lang) {
                    if ($lk == $v['name']) {
                        $v['lang_text'] = $lang['text'];
                        $v['lang'] = $lang['key'];
                        $v['state'] = 1;
                        break; // 找到匹配后跳出循环
                    }
                }
                $list[] = $v;
            }
            $result = array("total" => count($list), "rows" => $list);
            return json($result);
        }
        return $this->view->fetch();
    }

    /*上传安装*/
    public function local()
    {
        Config::set('default_return_type', 'json');
        $file = $this->request->file('file');
        try {
            ThemeService::local($file);
        } catch (Exception $e) {
            $this->error(__($e->getMessage()));
        }
        $this->success(__('Offline installed tips'));
    }

    /*安装*/
    public function install()
    {
        if ($this->request->isAjax()) {
            $name = $this->request->param('name');
            try {
                ThemeService::install($name);
            } catch (Exception $e) {
                $this->error(__($e->getMessage()));
            }
            $this->success(__('Offline installed tips'));
        }
    }

    /**
     * 获取模板组映射关系
     */
    private function getTemplateGroupMapping()
    {
        return [
            'default' => [
                'zh-cn' => 'default',
                'en' => 'en'
            ],
            'ldcms2024' => [
                'zh-cn' => 'ldcms2024',
                'en' => 'ldcms2024en'
            ],
            'ldcms2025' => [
                'zh-cn' => 'ldcms2025',
                'en' => 'ldcms2025en'
            ],
            'biubiustar2025' => [
                'vi-vn' => 'biubiustar2025vn',
                'en' => 'biubiustar2025en',
                'zh-cn' => 'biubiustar2025zh-cn',
                'zh-tw' => 'biubiustar2025zh-tw'
            ]
        ];
    }

    /**
     * 检测模板是否属于某个组，并获取组名
     */
    private function getTemplateGroup($templateName)
    {
        $groupMapping = $this->getTemplateGroupMapping();
        
        foreach ($groupMapping as $groupName => $templates) {
            if (in_array($templateName, $templates)) {
                return $groupName;
            }
        }
        
        return null; // 不属于任何组
    }

    /**
     * 启用模板组
     */
    private function enableTemplateGroup($groupName, $isImport = false)
    {
        $groupMapping = $this->getTemplateGroupMapping();
        
        if (!isset($groupMapping[$groupName])) {
            $this->error('模板组不存在');
        }
        
        $templates = $groupMapping[$groupName];
        $enableResults = [];
        $backupSql = '';
        
        // 如果需要导入数据，先备份第一个语言的数据
        if ($isImport && !empty($templates)) {
            $firstLang = array_keys($templates)[0];
            $firstTemplate = $templates[$firstLang];
            $currentConfig = ld_get_site_config($firstLang, true);
            $current_template = $currentConfig['template'];
            $backupSql = ThemeService::backupldcms($firstLang);
            
            // 写入 testdata.sql 文件
            $sqlFile = ThemeService::getThemesDir($current_template) . 'testdata.sql';
            file_put_contents($sqlFile, $backupSql);
        }
        
        // 循环处理每种语言的模板
        foreach ($templates as $lang => $templateName) {
            try {
                $configFull = ld_get_site_fullconfig($lang, true);
                $currentConfig = ld_get_site_config($lang, true);
                
                // 如果语言配置不存在，跳过
                if (empty($configFull) || empty($currentConfig)) {
                    $enableResults[$lang] = ['success' => false, 'error' => '语言配置不存在，请先在多语言管理中添加该语言'];
                    continue;
                }
                
                $current_template = $currentConfig['template'] ?? 'default';
                
                // 更新模板配置
                foreach ($configFull as &$conf) {
                    if ($conf['name'] == 'template') {
                        $conf['value'] = $templateName;
                    }
                }
                
                // 复制静态资源
                $sourceAssetsDir = ThemeService::getSourceAssetsDir($templateName);
                $destAssetsDir = ThemeService::getDestAssetsDir($templateName);
                if (is_dir($sourceAssetsDir)) {
                    copydirs($sourceAssetsDir, $destAssetsDir);
                    @rmdirs($sourceAssetsDir);
                }
                
                // 复制 uploads 数据
                $sourceUploadsDir = ThemeService::getSourceUploadsDir($templateName);
                $destUploadsDir = ThemeService::getDestUploadsDir($templateName);
                if (is_dir($sourceUploadsDir)) {
                    copydirs($sourceUploadsDir, $destUploadsDir);
                }
                
                // 保存配置
                ld_set_site_fullconfig($configFull, $lang);
                $enableResults[$lang] = ['success' => true, 'template' => $templateName];
                
            } catch (\Exception $e) {
                $enableResults[$lang] = ['success' => false, 'error' => $e->getMessage()];
                \think\Log::error("启用模板组失败 - 语言: {$lang}, 模板: {$templateName}, 错误: " . $e->getMessage());
            }
        }
        
        // 导入数据文件（只导入一次）
        if ($isImport) {
            $firstTemplate = reset($templates);
            ThemeService::importsql($firstTemplate);
        }
        
        // 刷新缓存
        rmdirs(CACHE_PATH, false);
        Cache::clear();
        rmdirs(TEMP_PATH, false);
        Service::refresh();
        
        // 生成结果消息
        $successLangs = [];
        $failedLangs = [];
        $langsModel = new Langs();
        $allLangs = $langsModel->getList();
        
        foreach ($enableResults as $lang => $result) {
            $langName = $allLangs[$lang] ?? $lang;
            if ($result['success']) {
                $successLangs[] = "{$langName}({$result['template']})";
            } else {
                $errorMsg = $result['error'] ?? '未知错误';
                $failedLangs[] = "{$langName}({$errorMsg})";
            }
        }
        
        $message = "模板组 '{$groupName}' 启用结果：";
        if (!empty($successLangs)) {
            $message .= ' 成功: ' . implode('、', $successLangs);
        }
        if (!empty($failedLangs)) {
            $message .= ' | 失败: ' . implode('、', $failedLangs);
        }
        
        if (empty($failedLangs)) {
            $this->success($message);
        } else {
            $this->error($message);
        }
    }

    /*启用*/
    public function enable()
    {
        $name = $this->request->param('name');
        $title = $this->request->param('title');
        $is_testdata = $this->request->param('is_testdata');
        if ($this->request->isPost()) {
            $lang = $this->request->param('lg', 'zh-cn');
            
            // 检查是否为组启用
            $templateGroup = $this->getTemplateGroup($name);
            if ($templateGroup) {
                return $this->enableTemplateGroup($templateGroup, $this->request->post('is_import'));
            }
            $configFull = ld_get_site_fullconfig($lang, true);
            $is_import = $this->request->post('is_import');
            //获取当前语言模版
            $currentConfig = ld_get_site_config($lang, true);
            $current_template = $currentConfig['template'];

            foreach ($configFull as &$conf) {
                if ($conf['name'] == 'template') {
                    $conf['value'] = $name;
                }
            }

            /*复制静态资源*/
            $sourceAssetsDir = ThemeService::getSourceAssetsDir($name);
            $destAssetsDir = ThemeService::getDestAssetsDir($name);
            if (is_dir($sourceAssetsDir)) {
                copydirs($sourceAssetsDir, $destAssetsDir);
                /*删除资源目录*/
                @rmdirs($sourceAssetsDir);
            }

            /*复制 uploads 数据*/
            $sourceUploadsDir = ThemeService::getSourceUploadsDir($name);
            $destUploadsDir = ThemeService::getDestUploadsDir($name);
            if (is_dir($sourceUploadsDir)) {
                copydirs($sourceUploadsDir, $destUploadsDir);
            }

            /*导入数据文件*/
            if ($is_import) {
                $sql = ThemeService::backupldcms($lang);

                // 写入 testdata.sql 文件
                $sqlFile = ThemeService::getThemesDir($current_template) . 'testdata.sql';
                file_put_contents($sqlFile, $sql);

                ThemeService::importsql($name);
            } else {
                ld_set_site_fullconfig($configFull, $lang);
            }
            // 刷新缓存
            rmdirs(CACHE_PATH, false);
            Cache::clear();
            rmdirs(TEMP_PATH, false);
            Service::refresh();
            $this->success('启用成功');
        } else {
            $langsModel = new Langs();
            $langs = $langsModel->getList();
            $this->view->assign('langs', $langs);
            $this->view->assign('name', $name);
            $this->view->assign('title', $title);
            $this->view->assign('is_testdata', $is_testdata);
            return $this->view->fetch();
        }
    }

    /*下载模板*/
    public function download()
    {
        $name = $this->request->param('name');
        $lang = $this->request->param('lg');
        /*备份数据*/
        $sql = ThemeService::backupldcms($lang);
        /*打包模板*/

        /*先复制 public 中的静态资源*/
        $destAssetsDir = ThemeService::getDestAssetsDir($name);
        $sourceAssetsDir = ThemeService::getSourceAssetsDir($name);
        if (is_dir($destAssetsDir)) {
            copydirs($destAssetsDir, $sourceAssetsDir);
        }

        $zip = new ZipArchive();
        $backUpdir = ThemeService::getThemesBackupDir();
        if (!is_dir($backUpdir)) {
            @mkdir($backUpdir, 0755);
        }
        $back_name = "ldcms-{$name}";
        $filename = $backUpdir . $back_name . ".zip";

        if ($zip->open($filename, ZIPARCHIVE::CREATE) !== true) {
            throw new Exception("Could not open <$filename>\n");
        }

        $files = new \RecursiveIteratorIterator(new \RecursiveDirectoryIterator(ThemeService::getThemesDir($name)), \RecursiveIteratorIterator::LEAVES_ONLY);
        $is_ini = false;
        foreach ($files as $k => $file) {
            if (!$file->isDir()) {
                $filePath = $file->getRealPath();
                $relativePath = str_replace(DS, '/', substr($filePath, strlen(ThemeService::getThemesDir($name))));
                /*修改 info.ini*/
                if ($relativePath == 'info.ini') {
                    $info = ThemeService::getInfo($name);
                    $info['install'] = 0;
                    $res = array();
                    foreach ($info as $key => $val) {
                        if (is_array($val)) {
                            $res[] = "[$key]";
                            foreach ($val as $skey => $sval) {
                                $res[] = "$skey = " . (is_numeric($sval) ? $sval : $sval);
                            }
                        } else {
                            $res[] = "$key = " . (is_numeric($val) ? $val : $val);
                        }
                    }
                    $zip->addFromString('info.ini', implode("\n", $res) . "\n");
                    $is_ini = true;
                } else {
                    $zip->addFile($filePath, $relativePath);
                }
            }
        }

        if (!$is_ini && in_array($name, ['default','en'])) {
            $info = [
                'name' => $name,
                'title' => $name == 'default' ? '默认中文模板' : '默认英文模板',
                'author' => 'ldcms',
                'thumb' => $name.'.png',
                'install' => 0,
            ];
            $res = array();
            foreach ($info as $key => $val) {
                if (is_array($val)) {
                    $res[] = "[$key]";
                    foreach ($val as $skey => $sval) {
                        $res[] = "$skey = " . (is_numeric($sval) ? $sval : $sval);
                    }
                } else {
                    $res[] = "$key = " . (is_numeric($val) ? $val : $val);
                }
            }
            $zip->addFromString('info.ini', implode("\n", $res) . "\n");
        }

        $sqlname = "testdata.sql";
        $zip->addFromString($sqlname, $sql);
        $zip->close();
        /*删除资源目录*/
        @rmdirs($sourceAssetsDir);
        /*下载*/
        Http::sendToBrowser($filename);
    }
}
