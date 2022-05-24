@echo off
setlocal
call :setESC
cls


title ZXHN H298A V1.0 modem root izni alma scripti

echo ============================================================================&
echo %ESC%[101;93m #Proje: ZTE H298A v1.0 modem iáin bÅtÅn root iülemlerini otomatik yapar. %ESC%[0m&
echo ============================================================================&
echo.&
echo %ESC%[104m #Desteklenen ÅrÅnler: %ESC%[0m& 
echo ============================================================================&
echo %ESC%[93m ZTE H298A V1.0 %ESC%[0m& 
echo.&
echo %ESC%[101;93m Modem seri numarançzç hazçrda bulundurun...òülem sçrasçnda ihtiyacçnçz olacak... %ESC%[0m 
echo ============================================================================&


:baslangic

echo ============================================================================&



::for /r %userprofile%\AppData\Local\Programs\Python %%a in (python.exe) do @if exist %%a echo %ESC%[42mDURUM:%ESC%[0mpython bulundu.

:pythonkontrol
set /P e=%ESC%[93mPython yÅklensin mi?%ESC%[0m [%ESC%[92mE%ESC%[0m/%ESC%[92mH%ESC%[0m]?
if /I "%e%" EQU "E" goto :pythonindir
if /I "%e%" EQU "H" goto :ztekontrol
goto :pythonkontrol




pause
:pythonindir
echo %ESC%[42mNOT:%ESC%[0m Kurulum baülayacak devam etmek iáin kurulumun tamamlanmasçnç bekleyin.
::echo %ESC%[42mNOT:%ESC%[0m Kurulum baülayacak, kurulum sçrasçnda %ESC%[92mAdd Phyton to Path%ESC%[0m seáeneßini iüaretleyin ve kurulumu tamamlayçn.

timeout 5
::explorer "https://www.python.org/downloads/"
powershell -command "Invoke-WebRequest https://www.python.org/ftp/python/3.10.4/python-3.10.4-amd64.exe -Outfile python-3.10.4-amd64.exe"
"%~dp0python-3.10.4-amd64.exe" /quiet InstallAllUsers=1 PrependPath=1 /log "%~dp0\Python-Install.log"
::https://silentinstallhq.com/python-3-10-silent-install-how-to-guide/
echo %ESC%[42mNOT:%ESC%[0m python kurulumu tamamlandç.
timeout 5




echo ============================================================================&

:ztekontrol
for %%b in (*) do (if exist "%~dp0setup.py" (echo %ESC%[42mDURUM:%ESC%[0mzte-config-utility dosyalarç bulundu.
goto :zcumodule
) else (
echo %ESC%[41mHATA:%ESC%[0m %ESC%[41mzte-config-utility dosyalarç bulunamadç, indirilecek ve áçkartçlacak. %ESC%[0m
timeout 5
goto :zteindir
)
)

:zteindir
powershell -command "Invoke-WebRequest https://github.com/mkst/zte-config-utility/archive/refs/heads/master.zip -Outfile zte-config-utility-master.zip"
powershell -nologo -noprofile -command "& { $shell = New-Object -COM Shell.Application; $target = $shell.NameSpace('%~dp0'); $zip = $shell.NameSpace('%~dp0zte-config-utility-master.zip'); $target.CopyHere($zip.Items(), 16); }"
xcopy "%~dp0zte-config-utility-master\*" "%~dp0" /e /r /y
if exist "%~dp0zte-config-utility-master.zip" del "%~dp0zte-config-utility-master.zip"
if exist "%~dp0zte-config-utility-master" rd /s /q "%~dp0zte-config-utility-master"

echo %ESC%[42mNOT:%ESC%[0m zte-config-utility zip dosyasç indirildi ve arüivden áçkarçldç.
timeout 5

echo ============================================================================&

:zcumodule
py "%~dp0setup.py" install --user
echo %ESC%[42mzcu modÅlÅ yÅklemesi tamamlandi...%ESC%[0m 


:pipinstallupgrade
for %%a in (*) do (if exist "C:\Python%%a\Scripts\pip.exe" (cd /d "C:\Python%%a\Scripts")
if exist "%LocalAppData%\Programs\Python\Python%%a\Scripts\pip.exe" (cd /d "%LocalAppData%\Programs\Python\Python%%a\Scripts"))

pip install --upgrade pip


:pycryptodomexinstall
pip install pycryptodomex


echo %ESC%[42mpip pycryptodemux yuklemesi tamamlandi...%ESC%[0m 
echo ------------------------------------------------------------------------------------------

for %%c in (*) do (if exist "C:\Python%%c\python.exe" (cd /d "C:\Python%%c")
if exist "%LocalAppData%\Programs\Python\Python%%c\python.exe" (cd /d "%LocalAppData%\Programs\Python\Python%%c"))

echo %ESC%[101;93m config.xml export zamani!  %ESC%[0m  

echo ============================================================================&

:configkontrol
if exist "%~dp0config.bin" (
echo %ESC%[42mDURUM:%ESC%[0mconfig.bin bulundu.

  goto :serinogir
) else (
echo %ESC%[41mHATA:%ESC%[0m %ESC%[41mconfig.bin dizinde bulunamadç. Modem Åzerinden indirilen config.bin dosyasçnç dizine kopyalayçnçz.%ESC%[0m
timeout 60
goto :configkontrol
)


echo ------------------------------------------------------------------------------------------

:serinogir
set /p SeriNo=%ESC%[101;93mModem Seri Numarasçnç Gir:%ESC%[0m


:export
py examples/decode.py --serial %SeriNo% config.bin config.xml | find /i "Failed! Trying again" && (echo.&echo ************************************************* &echo.&choice /n /c HE /m "Baüarçsçz...Seri numarasçnç yeniden girin? (E/H)" & if errorlevel 1 goto serinogir) || (echo Tamam...) &
::Traceback (most recent call last):

:exportbitti
echo %ESC%[42mconfig.xml EXPORT TAMAMLANDI  %ESC%[0m 

:replacekontrol
if exist "%~dp0replace.py" (
echo %ESC%[42mDURUM:%ESC%[0mreplace.py bulundu.

  goto :replace
) else (
echo %ESC%[41mHATA:%ESC%[0m %ESC%[41mreplace.py dizinde bulunamadç. òndirilecek ve dizine kopyalanacak.%ESC%[0m
timeout 5
goto :replaceindir
)

:replaceindir
::powershell -command "Invoke-WebRequest https://raw.githubusercontent.com/BoomBookTR/ZXHN-H298A-V1.0-Modem-Root-Permission-Batch-Script/main/replace.py -Outfile replace.py"
if not exist "%~dp0replace.py" powershell -command "Invoke-WebRequest https://raw.githubusercontent.com/BoomBookTR/ZXHN-H298A-V1.0-Modem-Root-Permission-Batch-Script/main/replace.py -Outfile replace.py"

echo %ESC%[42mNOT:%ESC%[0m zte-config-utility zip dosyasç indirildi.
goto :replacekontrol

timeout 5

echo ============================================================================&



:replace
::pushd "%~dp0"
::cd /d %~dp1
py "%~dp0replace.py"

echo ------------------------------------------------------------------------------------------

:import
echo %ESC%[101;93mconfig.bin import zamani!  %ESC%[0m  
echo ------------------------------------------------------------------------------------------
echo ------------------------------------------------------------------------------------------
echo ------------------------------------------------------------------------------------------

py examples/encode.py --serial %SeriNo% --signature "ZXHN H298A V1.0" config.xml config.bin | find /i "Failed! Trying again" && (echo.&echo ************************************************* &echo.&choice /n /c HE /m "Baüarçsçz...Seri numarasçnç yeniden girin? (E/H)" & if errorlevel 1 goto serinogir) || (echo Tamam...) &
::Failed! Trying again, with signature: ZXHNH298AV1.0
::Malformed decrypted payload, likely you used the wrong key!




:importbitti
echo %ESC%[42mconfig.xml IMPORT TAMAMLANDI  %ESC%[0m 

echo ------------------------------------------------------------------------------------------
echo ------------------------------------------------------------------------------------------
echo ------------------------------------------------------------------------------------------
echo ------------------------------------------------------------------------------------------
echo ------------------------------------------------------------------------------------------
echo ------------------------------------------------------------------------------------------

echo %ESC%[42m TUM ISLEMLER TAMAMLANDI. config.bin dosyanizi modem arayuzunden geri yukleyebilirsiniz.  %ESC%[0m 

:cikis
pause

:setESC
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set ESC=%%b
  exit /B 0
)
exit /B 0