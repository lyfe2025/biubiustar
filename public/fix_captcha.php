<?php
// 修正联系合作表单的验证码配置
try {
    $pdo = new PDO('mysql:host=127.0.0.1;dbname=biubiustar', 'root', '', [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
    ]);
    
    $stmt = $pdo->prepare("UPDATE fa_ldcms_diyform SET iscaptcha = 1 WHERE name = 'contact_cooperation'");
    $result = $stmt->execute();
    
    if ($result) {
        echo "✅ 验证码配置已启用\n";
    } else {
        echo "❌ 验证码配置失败\n";
    }
    
} catch (Exception $e) {
    echo "错误: " . $e->getMessage() . "\n";
}
?>