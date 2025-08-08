<?php
/**
 * 通过Web界面执行数据库修复
 * 访问：http://你的域名/fix_db.php
 */

// 简单的安全检查
$token = $_GET['token'] ?? '';
if ($token !== 'fix_templates_' . date('Ymd')) {
    die('❌ 访问令牌错误。请使用：?token=fix_templates_' . date('Ymd'));
}

// 引入FastAdmin的初始化文件
require_once dirname(__DIR__) . '/application/common.php';

use think\Db;

echo "<h2>🚀 LDCMS模板配置修复工具</h2>";
echo "<hr>";

try {
    echo "<h3>📊 修复前状态检查</h3>";
    
    // 检查当前配置状态
    $siteinfos = Db::name('ldcms_siteinfo')->select();
    
    echo "<table border='1' style='border-collapse: collapse; width: 100%;'>";
    echo "<tr><th>语言</th><th>JSON状态</th><th>模板名</th><th>问题</th></tr>";
    
    foreach ($siteinfos as $info) {
        $config = $info['config'];
        $jsonValid = json_decode($config) !== null;
        $templateName = '未知';
        $issue = '';
        
        if ($jsonValid) {
            $configArray = json_decode($config, true);
            if (isset($configArray[0]['value'])) {
                $templateName = $configArray[0]['value'];
                if (empty($templateName) || $templateName === 'null') {
                    $issue = '❌ 模板名为空';
                }
            } else {
                $issue = '❌ 缺少模板配置';
            }
        } else {
            $issue = '❌ JSON格式错误';
        }
        
        $jsonStatus = $jsonValid ? '✅ 有效' : '❌ 无效';
        echo "<tr>";
        echo "<td>{$info['lang']}</td>";
        echo "<td>{$jsonStatus}</td>";
        echo "<td>{$templateName}</td>";
        echo "<td>{$issue}</td>";
        echo "</tr>";
    }
    echo "</table>";
    
    echo "<h3>🔧 开始修复...</h3>";
    
    // 修复繁体中文配置
    $zhtwConfig = '[{"name":"template","title":"前台模板","type":"select","content":"[\"default\"]","value":"biubiustar2025zh-tw","rule":"required","msg":"","tip":"请确保addons/ldcms/view有相应的目录","ok":"","extend":""},{"name":"sitetitle","title":"网站标题","type":"string","content":[],"value":"BiuBiu Star Culture Media CO.,LTD","rule":"required","msg":"","tip":"","ok":"","extend":""},{"name":"sitesubtitle","title":"网站副标题","type":"string","content":[],"value":"BiuBiu Star Culture Media CO.,LTD","rule":"required","msg":"","tip":"","ok":"","extend":""},{"name":"seo_keywords","title":"网站关键词","type":"text","content":[],"value":"BiuBiu Star Culture Media CO.,LTD","rule":"","msg":"","tip":"","ok":"","extend":""},{"name":"seo_description","title":"网站描述","type":"text","content":[],"value":"BiuBiu Star Culture Media CO.,LTD","rule":"","msg":"","tip":"","ok":"","extend":""},{"name":"logo1","title":"网站logo","type":"image","content":[],"maximum":1,"value":"/assets/addons/ldcms/default/images/logo1.png","rule":"","msg":"","tip":"","ok":"","extend":""},{"name":"logo2","title":"网站logo","type":"image","content":[],"maximum":1,"value":"/assets/addons/ldcms/default/images/logo2.png","rule":"","msg":"","tip":"","ok":"","extend":""},{"name":"compony","title":"公司名称","type":"string","content":[],"value":"BiuBiu Star Culture Media CO.,LTD","rule":"required","msg":"","tip":"","ok":"","extend":""},{"type":"string","name":"tel","title":"联系电话","setting":{"table":"","conditions":"","key":"","value":""},"value":"400-000-0000","content":"","tip":"","rule":"","visible":"","extend":""},{"type":"string","name":"phone","title":"手机号","setting":{"table":"","conditions":"","key":"","value":""},"value":"+84 924 469 582","content":"","tip":"","rule":"","visible":"","extend":""},{"type":"text","name":"address","title":"地址","setting":{"table":"","conditions":"","key":"","value":""},"value":"38 Nguyễn Văn Kỉnh, Phường Thạnh Mỹ Lợi, Thủ Đức, Hồ Chí Minh 008428, Vietnam","content":"","tip":"","rule":"","visible":"","extend":""},{"type":"string","name":"email","title":"邮箱","setting":{"table":"","conditions":"","key":"","value":""},"value":"123123@163.com","content":"","tip":"","rule":"","visible":"","extend":""},{"type":"string","name":"contacts","title":"联系人","setting":{"table":"","conditions":"","key":"","value":""},"value":"李經理","content":"","tip":"","rule":"","visible":"","extend":""},{"type":"string","name":"qq","title":"在线咨询链接","setting":{"table":"","conditions":"","key":"","value":""},"value":"http://wpa.qq.com/msgrd?v=3&uin=&site=qq&menu=yes","content":"","tip":"","rule":"","visible":"","extend":""},{"type":"image","name":"wechat","title":"微信二维码","setting":{"table":"","conditions":"","key":"","value":""},"value":"/assets/addons/ldcms/default/images/qrcode.png","content":"","tip":"","rule":"","visible":"","extend":""},{"type":"image","name":"wechat2","title":"微信二维码2","setting":{"table":"","conditions":"","key":"","value":""},"value":"/assets/addons/ldcms/default/images/qrcode.png","content":"","tip":"","rule":"","visible":"","extend":""},{"type":"string","name":"icp","title":"ICP 備案號","setting":{"table":"","conditions":"","key":"","value":""},"value":"","content":"","tip":"","rule":"","visible":"","extend":""},{"type":"string","name":"copyright","title":"底部版權","setting":{"table":"","conditions":"","key":"","value":""},"value":"BiuBiu Star Culture Media CO.,LTD","content":"","tip":"","rule":"","visible":"","extend":""},{"type":"text","name":"script","title":"第三方代碼","setting":{"table":"","conditions":"","key":"","value":""},"value":"","content":"","tip":"","visible":"","rule":"","extend":""}]';
    
    $result1 = Db::name('ldcms_siteinfo')
        ->where('lang', 'zh-tw')
        ->update([
            'config' => $zhtwConfig,
            'update_time' => time()
        ]);
    
    echo "<p>✅ 繁体中文配置修复: " . ($result1 ? "成功 (影响 {$result1} 行)" : "失败") . "</p>";
    
    // 修复英语配置
    $enInfo = Db::name('ldcms_siteinfo')->where('lang', 'en')->find();
    if ($enInfo && $enInfo['config']) {
        $enConfigArray = json_decode($enInfo['config'], true);
        if ($enConfigArray && isset($enConfigArray[0])) {
            $enConfigArray[0]['value'] = 'biubiustar2025en';
            $newEnConfig = json_encode($enConfigArray, JSON_UNESCAPED_UNICODE);
            
            $result2 = Db::name('ldcms_siteinfo')
                ->where('lang', 'en')
                ->update([
                    'config' => $newEnConfig,
                    'update_time' => time()
                ]);
            
            echo "<p>✅ 英语配置修复: " . ($result2 ? "成功 (影响 {$result2} 行)" : "失败") . "</p>";
        }
    }
    
    // 清理缓存
    \think\Cache::clear();
    echo "<p>✅ 系统缓存已清理</p>";
    
    echo "<h3>📊 修复后状态验证</h3>";
    
    // 重新检查状态
    $newSiteinfos = Db::name('ldcms_siteinfo')->select();
    
    echo "<table border='1' style='border-collapse: collapse; width: 100%;'>";
    echo "<tr><th>语言</th><th>JSON状态</th><th>模板名</th><th>状态</th></tr>";
    
    foreach ($newSiteinfos as $info) {
        $config = $info['config'];
        $jsonValid = json_decode($config) !== null;
        $templateName = '未知';
        $status = '';
        
        if ($jsonValid) {
            $configArray = json_decode($config, true);
            if (isset($configArray[0]['value']) && !empty($configArray[0]['value'])) {
                $templateName = $configArray[0]['value'];
                $status = '✅ 正常';
            } else {
                $status = '⚠️ 模板名为空';
            }
        } else {
            $status = '❌ JSON无效';
        }
        
        $jsonStatus = $jsonValid ? '✅ 有效' : '❌ 无效';
        echo "<tr>";
        echo "<td>{$info['lang']}</td>";
        echo "<td>{$jsonStatus}</td>";
        echo "<td>{$templateName}</td>";
        echo "<td>{$status}</td>";
        echo "</tr>";
    }
    echo "</table>";
    
    echo "<h3>🎉 修复完成！</h3>";
    echo "<p><strong>请现在刷新模板管理页面查看结果。</strong></p>";
    echo "<p style='color: red;'><strong>重要：修复完成后请删除此文件 public/fix_db.php 以确保安全！</strong></p>";
    
} catch (Exception $e) {
    echo "<h3 style='color: red;'>❌ 执行出错</h3>";
    echo "<p>错误信息: " . htmlspecialchars($e->getMessage()) . "</p>";
    echo "<p>错误文件: " . $e->getFile() . " 第 " . $e->getLine() . " 行</p>";
}
?>