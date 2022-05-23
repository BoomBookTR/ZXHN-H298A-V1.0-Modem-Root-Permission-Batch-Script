@echo off
setlocal
call :setESC

title ZXHN H298A V1.0 Modem Root Permission config.bin Export and Import Batch File

cls


echo %ESC%[101;93m Modem seri numarançzç hazçrda bulundurun...òülem sçrasçnda ihtiyacçnçz olacak... %ESC%[0m 

echo ------------------------------------------------------------------------------------------
timeout 5

for %%a in (*) do (if exist "C:\Python%%a\Scripts\pip.exe" (cd /d "C:\Python%%a\Scripts")
if exist "%LocalAppData%\Programs\Python\Python%%a\Scripts\pip.exe" (cd /d "%LocalAppData%\Programs\Python\Python%%a\Scripts"))

pip install --upgrade pip
pip install pycryptodomex


echo %ESC%[42m Pip pycryptodemux yuklemesi tamamlandi...%ESC%[0m 
echo ------------------------------------------------------------------------------------------
timeout 5

for %%b in (*) do (if exist "C:\Python%%b\python.exe" (cd /d "C:\Python%%b")
if exist "%LocalAppData%\Programs\Python\Python%%b\python.exe" (cd /d "%LocalAppData%\Programs\Python\Python%%b"))


py setup.py install --user
echo %ESC%[42m setup.py install --user tamamlandi...%ESC%[0m 
echo %ESC%[101;93m config.xml export zamani!  %ESC%[0m  
echo ------------------------------------------------------------------------------------------
timeout 10
::MODEM SERI NUMARASI BURADA....
:serinogir
set /p SeriNo=%ESC%[101;93mModem Seri Numarasçnç Gir:%ESC%[0m
py examples/decode.py --serial %SeriNo% config.bin config.xml

echo %ESC%[42m config.xml EXPORT TAMAMLANDI  %ESC%[0m 
echo %ESC%[42m config.xml DOSYANIZDA GEREKLI ALANLARI DUZENLEYIP KAYDEDIN  %ESC%[0m 
echo %ESC%[44m"%ESC%[0m%ESC%[46m<DM name="ViewName" val="IGD.AU1"/>%ESC%[0m%ESC%[44m" altindaki "%ESC%[0m%ESC%[46m<DM name="Enable" val="0"/>%ESC%[0m%ESC%[44m" degerini"%ESC%[0m%ESC%[46m<DM name="Enable" val="1"/>%ESC%[0m%ESC%[44m" yap...%ESC%[0m 
echo %ESC%[44m"%ESC%[0m%ESC%[46m<DM name="SwitchShellEnable" val="0"/>%ESC%[0m%ESC%[44m" degerini"%ESC%[0m%ESC%[46m<DM name="SwitchShellEnable" val="1"/>%ESC%[0m%ESC%[44m" yap ve dosyayƒ± kaydet.%ESC%[0m 

echo ------------------------------------------------------------------------------------------

echo %ESC%[101;93m Hazir oldugunda bekleme zamanini gecebilirsiniz.%ESC%[0m 
echo ------------------------------------------------------------------------------------------
echo ------------------------------------------------------------------------------------------
echo ------------------------------------------------------------------------------------------ 

timeout 600
echo %ESC%[101;93m config.bin import zamani!  %ESC%[0m  
::MODEM SERI NUMARASI BURADA....

py examples/encode.py --serial %SeriNo% --signature "ZXHN H298A V1.0" config.xml config.bin
echo %ESC%[42m config.xml IMPORT TAMAMLANDI  %ESC%[0m 

echo ------------------------------------------------------------------------------------------
echo %ESC%[42m TUM ISLEMLER TAMAMLANDI. config.bin dosyanizi modem arayuzunden geri yukleyebilirsiniz.  %ESC%[0m 

pause

:setESC
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set ESC=%%b
  exit /B 0
)
exit /B 0