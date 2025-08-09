<?php

namespace app\admin\model\ldcms;

use think\Cache;
use addons\ldcms\model\common\Backend;

class SiteInfo extends Backend
{
    protected $name = 'ldcms_siteinfo';

    protected $type = ['config' => 'array'];

    /**
     * 保存配置
     * @param $data
     * @param $lang
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function setConfig($data, $lang)
    {
        $res = $this->where('lang', $lang)->find();
        if ($res) {
            $res->save(['config' => $data]);
        } else {
            $this->save(['lang' => $lang,'config' => $data]);
        }

        cache('site_info', null);
    }

    /**
     * @param $lang  语言
     * @param $uncached  实时获取
     * @return bool|mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getConfig($lang, $uncached = false)
    {
        if ($uncached) {
            $res = $this->where('lang', $lang)->find();
            // 清除指定语言的缓存
            Cache::rm('site_info_'.$lang);
        } else {
            $res = $this->where('lang', $lang)->cache('site_info_'.$lang, 3600)->find();
        }

        // 检查查询结果是否为空
        if (empty($res)) {
            return [];
        }

        $config = $res['config'] ?? [];
        
        // 如果config是字符串（JSON解析失败），尝试手动解析
        if (is_string($config)) {
            try {
                // 修复常见的JSON格式错误
                $fixedConfig = $config;
                // 修复zh-tw特有的问题: \"content\":\"[\"default\"]\" -> \"content\":[\"default\"]\n                $fixedConfig = preg_replace('/\"content\":\"\\[\"(.*?)\"\\]\"/', '\"content\":[\"$1\"]', $fixedConfig);\n                \n                // 修复嵌套引号问题
                $fixedConfig = preg_replace('/\"content\":\"(\[.*?\])\"/', '"content":$1', $fixedConfig);
                // 修复其他常见的引号转义问题
                $fixedConfig = str_replace('\"default\"', '"default"', $fixedConfig);
                
                $decoded = json_decode($fixedConfig, true);
                if (json_last_error() === JSON_ERROR_NONE && is_array($decoded)) {
                    $config = $decoded;
                } else {
                    // 尝试原始JSON解析
                    $decoded = json_decode($config, true);
                    if (json_last_error() === JSON_ERROR_NONE && is_array($decoded)) {
                        $config = $decoded;
                    } else {
                        // JSON解析失败，返回空数组
                        $config = [];
                    }
                }
            } catch (\Exception $e) {
                $config = [];
            }
        }
        
        // 如果是对象格式（数字索引），转换为数组
        if (is_array($config) && !empty($config)) {
            $normalizedConfig = [];
            foreach ($config as $item) {
                if (is_array($item)) {
                    $normalizedConfig[] = $item;
                }
            }
            if (!empty($normalizedConfig)) {
                $config = $normalizedConfig;
            }
        }

        return is_array($config) ? $config : [];
    }
}
