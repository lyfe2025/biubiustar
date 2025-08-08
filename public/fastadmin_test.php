<?php
// FastAdmin 框架测试
header('Content-Type: text/html; charset=utf-8');
echo "<h1>FastAdmin 框架测试</h1>";

// 基础检查
echo "<h2>1. 基础环境检查</h2>";
echo "PHP版本: " . phpversion() . "<br>";
echo "当前目录: " . __DIR__ . "<br>";
echo "项目根目录: " . dirname(__DIR__) . "<br>";

// ThinkPHP 检查
echo "<h2>2. ThinkPHP 框架检查</h2>";
$thinkPath = dirname(__DIR__) . '/thinkphp/';
if (file_exists($thinkPath)) {
    echo "✅ ThinkPHP 目录存在<br>";
    
    try {
        // 定义应用目录
        define('APP_PATH', dirname(__DIR__) . '/application/');
        
        // 加载框架引导文件
        require $thinkPath . 'base.php';
        
        echo "✅ ThinkPHP base.php 加载成功<br>";
        
        // 检查配置
        $envFile = dirname(__DIR__) . '/.env';
        if (file_exists($envFile)) {
            // 手动解析 .env 文件
            $lines = file($envFile);
            $env = [];
            foreach ($lines as $line) {
                $line = trim($line);
                if (empty($line) || $line[0] === '#') continue;
                
                if (strpos($line, '[') === 0) {
                    $section = trim($line, '[]');
                    continue;
                }
                
                if (strpos($line, '=') !== false) {
                    list($key, $value) = explode('=', $line, 2);
                    $key = trim($key);
                    $value = trim($value);
                    if (isset($section)) {
                        $env[$section][$key] = $value;
                    }
                }
            }
            
            echo "✅ .env 文件解析成功<br>";
            echo "数据库配置: " . json_encode($env['database'] ?? []) . "<br>";
            
            // 设置环境变量
            if (isset($env['database'])) {
                foreach ($env['database'] as $key => $value) {
                    $_ENV['database.' . $key] = $value;
                }
            }
        }
        
        // 启动框架
        require $thinkPath . 'start.php';
        echo "✅ ThinkPHP 框架启动成功<br>";
        
        // 测试数据库连接
        echo "<h2>3. FastAdmin 数据库连接测试</h2>";
        
        $config = \think\Config::get('database');
        echo "当前数据库配置: " . json_encode($config) . "<br>";
        
        $db = \think\Db::connect();
        $result = $db->query('SELECT COUNT(*) as count FROM fa_admin');
        echo "✅ FastAdmin 数据库连接成功！管理员数量: " . $result[0]['count'] . "<br>";
        
        // 测试配置表
        $configResult = $db->query('SELECT COUNT(*) as count FROM fa_config');
        echo "✅ 配置表查询成功！配置项数量: " . $configResult[0]['count'] . "<br>";
        
    } catch (Exception $e) {
        echo "❌ 错误: " . $e->getMessage() . "<br>";
        echo "错误文件: " . $e->getFile() . ":" . $e->getLine() . "<br>";
    }
} else {
    echo "❌ ThinkPHP 目录不存在: {$thinkPath}<br>";
}

// 清理测试文件
echo "<br><a href='#' onclick='fetch(\"/delete_test.php\"); location.reload();'>删除测试文件</a>";
?>