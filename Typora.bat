@echo off
:: 检查管理员权限
net session >nul 2>&1 || (
    echo 请右键以管理员身份运行此脚本！
    echo 3秒后自动退出...
    timeout /t 3 >nul
    exit /b
)

:: 主程序
set "MSG=正在设置Typora注册表权限..."
echo %MSG%

:: 1. 创建注册表项
reg add "HKEY_CURRENT_USER\SOFTWARE\Typora" /f >nul 2>&1

:: 2. 设置完全拒绝权限
(
    echo HKEY_CURRENT_USER\SOFTWARE\Typora []
) > "%temp%\~deny.txt"
regini "%temp%\~deny.txt"
del "%temp%\~deny.txt" >nul 2>&1

:: 结果显示
echo 已设置 HKEY_CURRENT_USER\SOFTWARE\Typora 权限为完全拒绝。
echo 3秒后自动退出...
timeout /t 3 >nul