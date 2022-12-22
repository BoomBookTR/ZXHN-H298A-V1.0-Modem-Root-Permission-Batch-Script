::  Written by @BoomBookTR


@echo off
setlocal EnableDelayedExpansion

::net file to test privileges, 1>NUL redirects output, 2>NUL redirects errors
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto START ) else ( goto getPrivileges ) 

:getPrivileges
if '%1'=='ELEV' ( goto START )

set "batchPath=%~f0"
set "batchArgs=ELEV"

::Add quotes to the batch path, if needed
set "script=%0"
set script=%script:"=%
IF '%0'=='!script!' ( GOTO PathQuotesDone )
    set "batchPath=""%batchPath%"""
:PathQuotesDone

::Add quotes to the arguments, if needed.
:ArgLoop
IF '%1'=='' ( GOTO EndArgLoop ) else ( GOTO AddArg )
    :AddArg
    set "arg=%1"
    set arg=%arg:"=%
    IF '%1'=='!arg!' ( GOTO NoQuotes )
        set "batchArgs=%batchArgs% "%1""
        GOTO QuotesDone
        :NoQuotes
        set "batchArgs=%batchArgs% %1"
    :QuotesDone
    shift
    GOTO ArgLoop
:EndArgLoop

::Create and run the vb script to elevate the batch file
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\OEgetPrivileges.vbs"
echo UAC.ShellExecute "cmd", "/c ""!batchPath! !batchArgs!""", "", "runas", 1 >> "%temp%\OEgetPrivileges.vbs"
"%temp%\OEgetPrivileges.vbs" 
exit /B

:START
::Remove the elevation tag and set the correct working directory
IF '%1'=='ELEV' ( shift /1 )
cd /d %~dp0

:: .... code start ....


@echo off
setlocal
call :setESC
cls


title ZTE ZXHN H298A V1.0 modem root izni alma scripti

echo ============================================================================&
echo %ESC%[101;93m #Proje: ZTE H298A v1.0 modem i�in b�t�n root i�lemlerini otomatik yapar. %ESC%[0m&
echo ============================================================================&
echo.&
echo %ESC%[104m #Desteklenen �r�nler: %ESC%[0m& 
echo ============================================================================&
echo %ESC%[93m ZTE H298A V1.0 %ESC%[0m& 
echo.&
echo %ESC%[101;93m Modem seri numaran�z� haz�rda bulundurun...��lem s�ras�nda ihtiyac�n�z olacak... %ESC%[0m 
echo ============================================================================&


:baslangic
echo ============================================================================&



::for /r %userprofile%\AppData\Local\Programs\Python %%a in (python.exe) do @if exist %%a echo %ESC%[42mDURUM:%ESC%[0mpython bulundu.


:pythonkontrol
set /P e=%ESC%[93mPython y�klensin mi?%ESC%[0m [%ESC%[92mE%ESC%[0m/%ESC%[92mH%ESC%[0m]?
if /I "%e%" EQU "E" goto :pythonindir
if /I "%e%" EQU "H" goto :pycommandkontrol
goto :pythonkontrol


:pythonindir
echo %ESC%[42mNOT:%ESC%[0m Kurulum ba�layacak devam etmek i�in kurulumun tamamlanmas�n� bekleyin.
::echo %ESC%[42mNOT:%ESC%[0m Kurulum ba�layacak, kurulum s�ras�nda %ESC%[92mAdd Phyton to Path%ESC%[0m se�ene�ini i�aretleyin ve kurulumu tamamlay�n.

::explorer "https://www.python.org/downloads/"
if exist "%~dp0python-3.11.1-amd64.exe" (
echo %ESC%[42mDURUM:%ESC%[0mpython-3.11.1-amd64.exe bulundu.

"%~dp0python-3.11.1-amd64.exe" /quiet InstallAllUsers=1 PrependPath=1 InstallLauncherAllUsers=1
) else (
echo %ESC%[41mHATA:%ESC%[0m %ESC%[41mpython-3.11.1-amd64.exe dizinde bulunamad�. �ndirilecek ve kurulum ba�layacakt�r.%ESC%[0m

powershell -command "Invoke-WebRequest https://www.python.org/ftp/python/3.11.1/python-3.11.1-amd64.exe -Outfile python-3.11.1-amd64.exe"
::"%~dp0python-3.11.1-amd64.exe" /quiet InstallAllUsers=1 PrependPath=1 /log "%~dp0\Python-Install.log"
"%~dp0python-3.11.1-amd64.exe" /quiet InstallAllUsers=1 PrependPath=1 InstallLauncherAllUsers=1
::"%~dp0python-3.11.1-amd64.exe" /quiet "%~dp0unattend.xml"
::python-3.11.1-amd64.exe /quiet .\unattend.xml
::"%~dp0python-3.11.1-amd64.exe" /quiet InstallAllUsers=1 PrependPath=1 Include_launcher=1 InstallLauncherAllUsers=1
::https://silentinstallhq.com/python-3-11-install-and-uninstall-powershell/
::https://silentinstallhq.com/python-3-11-silent-install-how-to-guide/
::https://silentinstallhq.com/python-3-10-silent-install-how-to-guide/
::https://docs.python.org/3/using/windows.html
echo %ESC%[42mNOT:%ESC%[0m python kurulumu tamamland�.
)

:pycommandkontrol
::How to fix error "'py.exe' is not recognized as an internal or external command, operable program or batch file"?
::doskey py = python
goto :pyindir

:pyindir
echo %ESC%[42mNot:%ESC%[0mpy Launcher sorunu varsa d�zeltiliyor.
::echo %ESC%[42mNOT:%ESC%[0m Kurulum ba�layacak, kurulum s�ras�nda %ESC%[92mAdd Phyton to Path%ESC%[0m se�ene�ini i�aretleyin ve kurulumu tamamlay�n.
::explorer "https://www.python.org/downloads/"

if exist "%~dp0python-3.11.1-amd64.exe" (
echo %ESC%[42mDURUM:%ESC%[0mpython-3.11.1-amd64.exe bulundu.
::"%~dp0python-3.11.1-amd64.exe" /uninstall /quiet
::MsiExec.exe /x {8A19B72D-62A8-4198-BEBD-CAEF117194C8} /qn
::MsiExec.exe /X {A28C27E4-A725-482A-9C65-61EDC0E4D583} /qn

"%~dp0python-3.11.1-amd64.exe" /quiet Include_launcher=1 Include_pip=1 Include_tcltk=1 Shortcuts=1 Include_doc=1 InstallLauncherAllUsers=1
) else (
echo %ESC%[41mHATA:%ESC%[0m %ESC%[41mpython-3.11.1-amd64.exe dizinde bulunamad�. �ndirilecek ve i�lem ba�layacakt�r.%ESC%[0m

::"%~dp0python-3.11.1-amd64.exe" /uninstall /quiet
::MsiExec.exe /x {463B0974-B1E1-401E-8F59-B0F9F81258E4} /qn
::MsiExec.exe /X {A28C27E4-A725-482A-9C65-61EDC0E4D583} /qn
powershell -command "Invoke-WebRequest https://www.python.org/ftp/python/3.11.1/python-3.11.1-amd64.exe -Outfile python-3.11.1-amd64.exe"
::"%~dp0python-3.11.1-amd64.exe" /quiet InstallAllUsers=1 PrependPath=1 /log "%~dp0\Python-Install.log"
"%~dp0python-3.11.1-amd64.exe" /quiet Include_launcher=1 Include_pip=1 Include_tcltk=1 Shortcuts=1 Include_doc=1 InstallLauncherAllUsers=1
::"%~dp0python-3.11.1-amd64.exe" /quiet "%~dp0unattend.xml"
::python-3.11.1-amd64.exe /quiet .\unattend.xml
::"%~dp0python-3.11.1-amd64.exe" /quiet InstallAllUsers=1 PrependPath=1 Include_launcher=1 InstallLauncherAllUsers=1
::https://silentinstallhq.com/python-3-11-install-and-uninstall-powershell/
::https://silentinstallhq.com/python-3-11-silent-install-how-to-guide/
::https://silentinstallhq.com/python-3-10-silent-install-how-to-guide/
::https://docs.python.org/3/using/windows.html
echo %ESC%[42mNOT:%ESC%[0m py launcher sorunu varsa d�zeltildi.
)


echo ============================================================================&

:ztekontrol
for %%b in (*) do (if exist "%~dp0setup.py" (echo %ESC%[42mDURUM:%ESC%[0mzte-config-utility dosyalar� bulundu.
goto :zcumodule
) else (
echo %ESC%[41mHATA:%ESC%[0m %ESC%[41mzte-config-utility dosyalar� bulunamad�, indirilecek ve ��kart�lacak. %ESC%[0m
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

echo %ESC%[42mNOT:%ESC%[0m zte-config-utility zip dosyas� indirildi ve ar�ivden ��kar�ld�.

echo ============================================================================&



:zcumodule
py "%~dp0setup.py" install --user
::python "%~dp0setup.py" install --user
echo %ESC%[42mzcu mod�l� y�klemesi tamamland�...%ESC%[0m 


:pipinstallupgrade
for %%a in (*) do (if exist "C:\Python%%a\Scripts\pip.exe" (cd /d "C:\Python%%a\Scripts")
if exist "%LocalAppData%\Programs\Python\Python%%a\Scripts\pip.exe" (cd /d "%LocalAppData%\Programs\Python\Python%%a\Scripts"))

pip install --upgrade pip


:pycryptodomexinstall
pip install pycryptodomex


echo %ESC%[42mpip pycryptodemux y�klemesi tamamland�...%ESC%[0m 
echo ------------------------------------------------------------------------------------------

for %%c in (*) do (if exist "C:\Python%%c\python.exe" (cd /d "C:\Python%%c")
if exist "%LocalAppData%\Programs\Python\Python%%c\python.exe" (cd /d "%LocalAppData%\Programs\Python\Python%%c"))

echo %ESC%[101;93m config.xml export zaman�!  %ESC%[0m  

echo ============================================================================&

:configkontrol
if exist "%~dp0config.bin" (
echo %ESC%[42mDURUM:%ESC%[0mconfig.bin bulundu.

  goto :serinogir
) else (
echo %ESC%[41mHATA:%ESC%[0m %ESC%[41mconfig.bin dizinde bulunamad�. Modem �zerinden indirilen config.bin dosyas�n� klas�r konumuna kopyalay�n�z.%ESC%[0m
timeout 60
goto :configkontrol
)


echo ------------------------------------------------------------------------------------------

:serinogir
set /p SeriNo=%ESC%[101;93mModem Seri Numaras�n� Gir:%ESC%[0m


:export
py examples/decode.py --serial %SeriNo% config.bin config.xml | find /i "Successfully decoded using serial" & if not errorlevel 1 (
echo *************************************************
goto :exportbitti
) else (
echo *************************************************
echo HATA: Seri numaras� yanl��! Do�ru seri numaras� girin!
echo HATA: Seri numaras� yanl��! Do�ru seri numaras� girin!
echo HATA: Seri numaras� yanl��! Do�ru seri numaras� girin!
echo HATA: Seri numaras� yanl��! Do�ru seri numaras� girin!
echo HATA: Seri numaras� yanl��! Do�ru seri numaras� girin!
goto :serinogir
)
::py examples/decode.py --serial %SeriNo% config.bin config.xml | find /i "Successfully decoded using serial" & if not errorlevel 1 (goto :exportbitti) else (goto :serinogir)
::python examples/decode.py --serial %SeriNo% config.bin config.xml | find /i "Successfully decoded using serial" && (echo.&echo ************************************************* & if errorlevel 2 goto :exportbitti) || (echo Ba�ar�s�z... Seri numaras�n� tekrar gir & goto :serinogir) &


::Traceback (most recent call last):

:exportbitti
echo %ESC%[42mconfig.xml EXPORT tamamland�  %ESC%[0m 

:replacekontrol
if exist "%~dp0replace.py" (
echo %ESC%[42mDURUM:%ESC%[0mreplace.py bulundu.

  goto :replace
) else (
echo %ESC%[41mHATA:%ESC%[0m %ESC%[41mreplace.py dizinde bulunamad�. �ndirilecek...%ESC%[0m

goto :replaceindir
)

:replaceindir
::powershell -command "Invoke-WebRequest https://raw.githubusercontent.com/BoomBookTR/ZXHN-H298A-V1.0-Modem-Root-Permission-Batch-Script/main/replace.py -Outfile replace.py"
if not exist "%~dp0replace.py" powershell -command "Invoke-WebRequest https://raw.githubusercontent.com/BoomBookTR/ZXHN-H298A-V1.0-Modem-Root-Permission-Batch-Script/main/replace.py -Outfile replace.py"

echo %ESC%[42mNOT:%ESC%[0m zte-config-utility zip dosyas� indirildi.
goto :replacekontrol



echo ============================================================================&



:replace
::pushd "%~dp0"
::cd /d %~dp1
py "%~dp0replace.py"
::python "%~dp0replace.py"


echo ------------------------------------------------------------------------------------------

:import
echo %ESC%[101;93mconfig.bin import zaman�!  %ESC%[0m  
echo ------------------------------------------------------------------------------------------
echo ------------------------------------------------------------------------------------------
echo ------------------------------------------------------------------------------------------

py examples/encode.py --serial %SeriNo% --signature "ZXHN H298A V1.0" config.xml config.bin | find /i "Done" & if not errorlevel 1 (
echo *************************************************
goto :importbitti
) else (
echo *************************************************
echo HATA: Seri numaras� yanl��! Do�ru seri numaras� girin!
echo HATA: Seri numaras� yanl��! Do�ru seri numaras� girin!
echo HATA: Seri numaras� yanl��! Do�ru seri numaras� girin!
echo HATA: Seri numaras� yanl��! Do�ru seri numaras� girin!
echo HATA: Seri numaras� yanl��! Do�ru seri numaras� girin!
goto :serinogir
)

::py examples/encode.py --serial %SeriNo% --signature "ZXHN H298A V1.0" config.xml config.bin | find /i "Done" & if not errorlevel 1 (goto :importbitti) else (goto :serinogir)
::python examples/encode.py --serial %SeriNo% --signature "ZXHN H298A V1.0" config.xml config.bin | find /i "Done" & if not errorlevel 1 (goto :importbitti) else (goto :serinogir)


::Failed! Trying again, with signature: ZXHNH298AV1.0
::Malformed decrypted payload, likely you used the wrong key!




:importbitti
echo %ESC%[42mconfig.xml IMPORT tamamland�.  %ESC%[0m 

echo ------------------------------------------------------------------------------------------
echo ------------------------------------------------------------------------------------------
echo ------------------------------------------------------------------------------------------
echo ------------------------------------------------------------------------------------------
echo ------------------------------------------------------------------------------------------
echo ------------------------------------------------------------------------------------------

echo %ESC%[42m T�M �SLEMLER tamamland�. config.bin dosyan�z� modem aray�z�nden geri y�kleyebilirsiniz.  %ESC%[0m 

:cikis
pause



:setESC
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set ESC=%%b
  exit /B 0
)
exit /B 0