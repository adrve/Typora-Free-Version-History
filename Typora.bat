@echo off
:: ������ԱȨ��
net session >nul 2>&1 || (
    echo ���Ҽ��Թ���Ա������д˽ű���
    echo 3����Զ��˳�...
    timeout /t 3 >nul
    exit /b
)

:: ������
set "MSG=��������Typoraע���Ȩ��..."
echo %MSG%

:: 1. ����ע�����
reg add "HKEY_CURRENT_USER\SOFTWARE\Typora" /f >nul 2>&1

:: 2. ������ȫ�ܾ�Ȩ��
(
    echo HKEY_CURRENT_USER\SOFTWARE\Typora []
) > "%temp%\~deny.txt"
regini "%temp%\~deny.txt"
del "%temp%\~deny.txt" >nul 2>&1

:: �����ʾ
echo ������ HKEY_CURRENT_USER\SOFTWARE\Typora Ȩ��Ϊ��ȫ�ܾ���
echo 3����Զ��˳�...
timeout /t 3 >nul