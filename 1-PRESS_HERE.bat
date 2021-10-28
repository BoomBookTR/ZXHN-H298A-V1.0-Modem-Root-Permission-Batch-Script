@echo off
setlocal
call :setESC

title ZXHN H298A V1.0 Modem Root Permission config.bin Export and Import Batch File

cls


echo %ESC%[101;93m BU ISLEM ONCESINDE MUTLAKA MODEM SERI NUMARANIZI 1-PRESS_HERE.bat ICERISINDEN DUZENLEYIN. %ESC%[0m 

echo %ESC%[42m ORNEK (satir 38):%ESC%[0m py examples/decode.py --serial ZTXXXXXXXXXXXXX config.bin config.xml 
echo %ESC%[42m ORNEK (satir 57):%ESC%[0m py examples/encode.py --serial ZTXXXXXXXXXXXXX --signature "ZXHN H298A V1.0" config.xml config.bin
echo ------------------------------------------------------------------------------------------
timeout 5

echo %ESC%[41m Islem hazirsaniz baslayacak...%ESC%[0m
echo %ESC%[41m Eger seri numaranizi guncellemediyseniz bu pencereyi kapatip duzenleyip tekrar acin.%ESC%[0m
echo %ESC%[41m Hazirsaniz geri sayimi beklemeden baslayabilirsiniz.%ESC%[0m
echo ------------------------------------------------------------------------------------------
timeout 60

cd /d "%LocalAppData%\Programs\Python\Python39\Scripts"
pip install pycryptodomex

echo %ESC%[42m Pip pycryptodemux yuklemesi tamamlandi...%ESC%[0m 
echo ------------------------------------------------------------------------------------------
timeout 10

cd /d %~dp0


py setup.py install --user
echo %ESC%[42m setup.py install --user tamamlandi...%ESC%[0m 
echo %ESC%[101;93m config.xml export zamani!  %ESC%[0m  
echo ------------------------------------------------------------------------------------------
timeout 10
::MODEM SERI NUMARASI BURADA....
py examples/decode.py --serial ZTSERINUMARASI config.bin config.xml

echo %ESC%[42m config.xml EXPORT TAMAMLANDI  %ESC%[0m 
echo %ESC%[42m config.xml DOSYANIZDA GEREKLI ALANLARI DUZENLEYIP KAYDEDIN  %ESC%[0m 
echo %ESC%[44m"%ESC%[0m%ESC%[46m<DM name="ViewName" val="IGD.AU1"/>%ESC%[0m%ESC%[44m" altindaki "%ESC%[0m%ESC%[46m<DM name="Enable" val="0"/>%ESC%[0m%ESC%[44m" degerini"%ESC%[0m%ESC%[46m<DM name="Enable" val="1"/>%ESC%[0m%ESC%[44m" yap...%ESC%[0m 
echo %ESC%[44m"%ESC%[0m%ESC%[46m<DM name="SwitchShellEnable" val="0"/>%ESC%[0m%ESC%[44m" degerini"%ESC%[0m%ESC%[46m<DM name="SwitchShellEnable" val="1"/>%ESC%[0m%ESC%[44m" yap ve dosyayı kaydet.%ESC%[0m 

echo ------------------------------------------------------------------------------------------

echo %ESC%[101;93m Hazir oldugunda bekleme zamanini gecebilirsiniz.%ESC%[0m 
echo ------------------------------------------------------------------------------------------
echo ------------------------------------------------------------------------------------------
echo ------------------------------------------------------------------------------------------ 

timeout 600
echo %ESC%[101;93m config.bin import zamani!  %ESC%[0m  
::MODEM SERI NUMARASI BURADA....

py examples/encode.py --serial ZTSERINUMARASI --signature "ZXHN H298A V1.0" config.xml config.bin
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
