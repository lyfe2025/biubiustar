<?php
// 简单的数据库连接测试
header('Content-Type: text/html; charset=utf-8');

echo "<h1>BiuBiuStar 数据库连接测试</h1>";

// 测试环境变量
echo "<h2>环境变量检测</h2>";
$envFile = dirname(__DIR__) . '/.env';
if (file_exists($envFile)) {
    $env = parse_ini_file($envFile, true);
    echo "✅ .env 文件存在<br>";
    echo "数据库配置:<br>";
    echo "- Host: " . ($env['database']['hostname'] ?? '未设置') . "<br>";
    echo "- Database: " . ($env['database']['database'] ?? '未设置') . "<br>";
    echo "- Username: " . ($env['database']['username'] ?? '未设置') . "<br>";
    echo "- Port: " . ($env['database']['hostport'] ?? '未设置') . "<br>";
} else {
    echo "❌ .env 文件不存在<br>";
}

// PDO 直接连接测试
echo "<h2>PDO 连接测试</h2>";
try {
    $host = $env['database']['hostname'] ?? '127.0.0.1';
    $port = $env['database']['hostport'] ?? '3306';
    $dbname = $env['database']['database'] ?? 'biubiustar';
    $username = $env['database']['username'] ?? 'biubiustar';
    $password = $env['database']['password'] ?? 'Qwer1234...';
    
    $dsn = "mysql:host={$host};port={$port};dbname={$dbname};charset=utf8mb4";
    $pdo = new PDO($dsn, $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    $result = $pdo->query('SELECT COUNT(*) as count FROM fa_admin');
    $count = $result->fetch()['count'];
    echo "✅ PDO 连接成功！管理员数量: {$count}<br>";
    
    // 测试查询
    $stmt = $pdo->query('SELECT username, nickname FROM fa_admin LIMIT 1');
    $admin = $stmt->fetch();
    echo "✅ 管理员信息: {$admin['username']} ({$admin['nickname']})<br>";
    
} catch (Exception $e) {
    echo "❌ PDO 连接失败: " . $e->getMessage() . "<br>";
}

echo "<h2>PHP 信息</h2>";
echo "PHP 版本: " . phpversion() . "<br>";
echo "当前时间: " . date('Y-m-d H:i:s') . "<br>";
echo "项目路径: " . __DIR__ . "<br>";
?>