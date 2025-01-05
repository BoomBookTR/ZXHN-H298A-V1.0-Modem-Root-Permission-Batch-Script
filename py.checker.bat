@echo off

py --version

pip list

echo ------- -------
py --version >nul 2>&1
if %errorlevel% neq 0 (
    echo "py komutu bulunamadi veya calismiyor."
) else (
    echo "py komutu calisiyor."
)
echo ------- -------


python --version

pip list

echo ------- -------
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo "python komutu bulunamadi veya calismiyor."
) else (
    echo "python komutu calisiyor."
)
echo ------- -------
pause