@echo off

py --version

echo ------- -------
py --version >nul 2>&1
if %errorlevel% neq 0 (
    echo "py komutu bulunamadi veya calismiyor."
) else (
    echo "py komutu calisiyor."
)
echo ------- -------

python --version

echo ------- -------
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo "python komutu bulunamadi veya calismiyor."
) else (
    echo "python komutu calisiyor."
)
echo ------- -------
echo ------- -------
echo ------- -------
pip list
echo ------- -------
echo ------- -------
echo ------- -------
where python
echo ------- -------
pause