:: XboxHD by ldotsfan
:: Modifications by Rocky5 to make this batch file to look pretty
:: Portions Copyright by Rocky5 Forums & JCRocky5 Twitter 2016

@Echo off & SetLocal EnableDelayedExpansion & mode con:cols=56 lines=20 & Title Xbox Hard Drive Maker for Windows
goto getadminwrites

:start
cd %~dp0
CD "XboxHD"

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Version Number & Colour
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
For /f "tokens=2,* delims==" %%a in ('findstr /b /i /l "Version" "Config.ini"') do Set "Version=%%a"
For /f "tokens=2,* delims==" %%a in ('findstr /b /i /l "Colour" "Config.ini"') do Color %%a
For /f "tokens=2,* delims==" %%a in ('findstr /b /i /l "MenuDelay" "Config.ini"') do Set "Delay=%%a"

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: GUI Elements.
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Set "GUI_Element_1=echo 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴"
Set "GUI_Element_2=Echo 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴� by ldotsfan"
Set "GUI_Element_3=Echo 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴� GUI by Rocky5"
Set "GUI_Element_4=echo 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴� Version %Version%"
Set "GUI_Element_5=echo 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴� Error"
Set "GUI_Element_6=echo 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�"

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Get list of USB Devices.
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
for /f "tokens=2 delims=\\.\" %%b in ('wmic diskdrive get model ^, name ^| find /i "USB"') do echo %%b>>tmp
if exist "tmp" (
For /f "tokens=1 delims=" %%a in ('findstr /b /i /l "PHYSICALDRIVE0" "tmp"') do Set "drive0=%%a"
for /f "tokens=1 delims=\\.\" %%b in ('wmic diskdrive get model ^, name ^| find /i "PHYSICALDRIVE0"') do set "drivename0=%%b"
For /f "tokens=1 delims=" %%a in ('findstr /b /i /l "PHYSICALDRIVE1" "tmp"') do Set "drive1=%%a"
for /f "tokens=1 delims=\\.\" %%b in ('wmic diskdrive get model ^, name ^| find /i "PHYSICALDRIVE1"') do set "drivename1=%%b"
For /f "tokens=1 delims=" %%a in ('findstr /b /i /l "PHYSICALDRIVE2" "tmp"') do Set "drive2=%%a"
for /f "tokens=1 delims=\\.\" %%b in ('wmic diskdrive get model ^, name ^| find /i "PHYSICALDRIVE2"') do set "drivename2=%%b"
For /f "tokens=1 delims=" %%a in ('findstr /b /i /l "PHYSICALDRIVE3" "tmp"') do Set "drive3=%%a"
for /f "tokens=1 delims=\\.\" %%b in ('wmic diskdrive get model ^, name ^| find /i "PHYSICALDRIVE3"') do set "drivename3=%%b"
For /f "tokens=1 delims=" %%a in ('findstr /b /i /l "PHYSICALDRIVE4" "tmp"') do Set "drive4=%%a"
for /f "tokens=1 delims=\\.\" %%b in ('wmic diskdrive get model ^, name ^| find /i "PHYSICALDRIVE4"') do set "drivename4=%%b"
For /f "tokens=1 delims=" %%a in ('findstr /b /i /l "PHYSICALDRIVE5" "tmp"') do Set "drive5=%%a"
for /f "tokens=1 delims=\\.\" %%b in ('wmic diskdrive get model ^, name ^| find /i "PHYSICALDRIVE5"') do set "drivename5=%%b"
del /q tmp
)

:Splash :D
CLS & echo: & echo: & echo: & echo: & echo: & echo:
%GUI_Element_1%
echo  Xbox Hard Drive Maker for Windows
echo:
%GUI_Element_2%
%GUI_Element_3%
%GUI_Element_4%
timeout /t %Delay% >NUL

:menu
mode con:cols=56 lines=20
CLS & echo: & echo: & echo: & echo:
echo  Main Menu
echo:
set "entry="
echo  1. List drives connected
echo  2. Launch xboxhdm
echo  3. Lock hard drive with EEPROM
echo  4. Unlock hard drive with EEPROM
echo  5. Lock hard drive for nulled EEPROM console
echo  6. Unlock hard drive for nulled EEPROM console
echo  7. Check Lock Status
echo:
echo  or press "Enter" to exit
echo:
set /p entry=Enter Choice:
if "%entry%"=="1" cls & Echo: & Echo: & call listdrives.bat & timeout /t 30 & goto menu
if "%entry%"=="2" goto xboxhd
if "%entry%"=="3" goto lockhd
if "%entry%"=="4" goto unlockhd
if "%entry%"=="5" goto locknullhd
if "%entry%"=="6" goto unlocknullhd
if "%entry%"=="7" goto checklockhd
if "%entry%"=="" exit
echo Error: Incorrect entry.
timeout /t %Delay%
goto menu


:xboxhd
CLS & echo: & echo: & echo:
echo:
echo  Menu ^= Launch xboxhdm
echo:
set "entry="
if "%drive0%"=="PHYSICALDRIVE0  " echo  0. PHYSICALDRIVE0 - %drivename0%
if "%drive1%"=="PHYSICALDRIVE1  " echo  1. PHYSICALDRIVE1 - %drivename1%
if "%drive2%"=="PHYSICALDRIVE2  " echo  2. PHYSICALDRIVE2 - %drivename2%
if "%drive3%"=="PHYSICALDRIVE3  " echo  3. PHYSICALDRIVE3 - %drivename3%
if "%drive4%"=="PHYSICALDRIVE4  " echo  4. PHYSICALDRIVE4 - %drivename4%
if "%drive5%"=="PHYSICALDRIVE5  " echo  5. PHYSICALDRIVE5 - %drivename5%
echo:
echo  or press "Enter" to go back.
echo:
set /p entry=Enter Choice:
if "%drive0%"=="PHYSICALDRIVE0  " if "%entry%"=="0" call launch.bat 0 & goto menu
if "%drive0%"=="PHYSICALDRIVE0  " if "%entry%"=="0rw" call launchrw.bat 0 & goto menu
if "%drive1%"=="PHYSICALDRIVE1  " if "%entry%"=="1" call launch.bat 1 & goto menu
if "%drive1%"=="PHYSICALDRIVE1  " if "%entry%"=="1rw" call launchrw.bat 1 & goto menu
if "%drive2%"=="PHYSICALDRIVE2  " if "%entry%"=="2" call launch.bat 2 & goto menu
if "%drive2%"=="PHYSICALDRIVE2  " if "%entry%"=="2rw" call launchrw.bat 2 & goto menu
if "%drive3%"=="PHYSICALDRIVE3  " if "%entry%"=="3" call launch.bat 3 & goto menu
if "%drive3%"=="PHYSICALDRIVE3  " if "%entry%"=="3rw" call launchrw.bat 3 & goto menu
if "%drive4%"=="PHYSICALDRIVE4  " if "%entry%"=="4" call launch.bat 4 & goto menu
if "%drive4%"=="PHYSICALDRIVE4  " if "%entry%"=="4rw" call launchrw.bat 4 & goto menu
if "%drive5%"=="PHYSICALDRIVE5  " if "%entry%"=="5" call launch.bat 5 & goto menu
if "%drive5%"=="PHYSICALDRIVE5  " if "%entry%"=="5rw" call launchrw.bat 5 & goto menu
if "%entry%"=="" goto menu
echo Error: Incorrect entry.
timeout /t %Delay% 
goto xboxhd

:lockhd
CLS & echo: & echo: & echo:
echo:
echo  Menu ^= Lock xbox hard drive with EEPROM
echo:
set "entry="
if "%drive0%"=="PHYSICALDRIVE0  " echo  0. PHYSICALDRIVE0 - %drivename0%
if "%drive1%"=="PHYSICALDRIVE1  " echo  1. PHYSICALDRIVE1 - %drivename1%
if "%drive2%"=="PHYSICALDRIVE2  " echo  2. PHYSICALDRIVE2 - %drivename2%
if "%drive3%"=="PHYSICALDRIVE3  " echo  3. PHYSICALDRIVE3 - %drivename3%
if "%drive4%"=="PHYSICALDRIVE4  " echo  4. PHYSICALDRIVE4 - %drivename4%
if "%drive5%"=="PHYSICALDRIVE5  " echo  5. PHYSICALDRIVE5 - %drivename5%
echo:
echo  or press "Enter" to go back.
echo:
set /p entry=Enter Choice:
if "%drive0%"=="PHYSICALDRIVE0  " if "%entry%"=="0" call lockhdd.bat a & goto menu
if "%drive1%"=="PHYSICALDRIVE1  " if "%entry%"=="1" call lockhdd.bat b & goto menu
if "%drive2%"=="PHYSICALDRIVE2  " if "%entry%"=="2" call lockhdd.bat c & goto menu
if "%drive3%"=="PHYSICALDRIVE3  " if "%entry%"=="3" call lockhdd.bat d & goto menu
if "%drive4%"=="PHYSICALDRIVE4  " if "%entry%"=="4" call lockhdd.bat e & goto menu
if "%drive5%"=="PHYSICALDRIVE5  " if "%entry%"=="5" call lockhdd.bat f & goto menu
if "%entry%"=="" goto menu
echo Error: Incorrect entry.
timeout /t %Delay% 
goto lockhd

:locknullhd
CLS & echo: & echo: & echo:
echo:
echo  Menu ^= Lock xbox hard drive for nulled EEPROM console
echo:
set "entry="
if "%drive0%"=="PHYSICALDRIVE0  " echo  0. PHYSICALDRIVE0 - %drivename0%
if "%drive1%"=="PHYSICALDRIVE1  " echo  1. PHYSICALDRIVE1 - %drivename1%
if "%drive2%"=="PHYSICALDRIVE2  " echo  2. PHYSICALDRIVE2 - %drivename2%
if "%drive3%"=="PHYSICALDRIVE3  " echo  3. PHYSICALDRIVE3 - %drivename3%
if "%drive4%"=="PHYSICALDRIVE4  " echo  4. PHYSICALDRIVE4 - %drivename4%
if "%drive5%"=="PHYSICALDRIVE5  " echo  5. PHYSICALDRIVE5 - %drivename5%
echo:
echo  or press "Enter" to go back.
echo:
set /p entry=Enter Choice:
if "%drive0%"=="PHYSICALDRIVE0  " if "%entry%"=="0" call locknullhdd.bat a & goto menu
if "%drive1%"=="PHYSICALDRIVE1  " if "%entry%"=="1" call locknullhdd.bat b & goto menu
if "%drive2%"=="PHYSICALDRIVE2  " if "%entry%"=="2" call locknullhdd.bat c & goto menu
if "%drive3%"=="PHYSICALDRIVE3  " if "%entry%"=="3" call locknullhdd.bat d & goto menu
if "%drive4%"=="PHYSICALDRIVE4  " if "%entry%"=="4" call locknullhdd.bat e & goto menu
if "%drive5%"=="PHYSICALDRIVE5  " if "%entry%"=="5" call locknullhdd.bat f & goto menu
if "%entry%"=="" goto menu
echo Error: Incorrect entry.
timeout /t %Delay%
goto locknullhd

:unlockhd
CLS & echo: & echo: & echo:
echo:
echo  Menu ^= Unlock xbox hard drive with EEPROM
echo:
set "entry="
if "%drive0%"=="PHYSICALDRIVE0  " echo  0. PHYSICALDRIVE0 - %drivename0%
if "%drive1%"=="PHYSICALDRIVE1  " echo  1. PHYSICALDRIVE1 - %drivename1%
if "%drive2%"=="PHYSICALDRIVE2  " echo  2. PHYSICALDRIVE2 - %drivename2%
if "%drive3%"=="PHYSICALDRIVE3  " echo  3. PHYSICALDRIVE3 - %drivename3%
if "%drive4%"=="PHYSICALDRIVE4  " echo  4. PHYSICALDRIVE4 - %drivename4%
if "%drive5%"=="PHYSICALDRIVE5  " echo  5. PHYSICALDRIVE5 - %drivename5%
echo:
echo  or press "Enter" to go back.
echo:
set /p entry=Enter Choice:
if "%drive0%"=="PHYSICALDRIVE0  " if "%entry%"=="0" call unlockhdd.bat a & goto menu
if "%drive1%"=="PHYSICALDRIVE1  " if "%entry%"=="1" call unlockhdd.bat b & goto menu
if "%drive2%"=="PHYSICALDRIVE2  " if "%entry%"=="2" call unlockhdd.bat c & goto menu
if "%drive3%"=="PHYSICALDRIVE3  " if "%entry%"=="3" call unlockhdd.bat d & goto menu
if "%drive4%"=="PHYSICALDRIVE4  " if "%entry%"=="4" call unlockhdd.bat e & goto menu
if "%drive5%"=="PHYSICALDRIVE5  " if "%entry%"=="5" call unlockhdd.bat f & goto menu
if "%entry%"=="" goto menu
echo Error: Incorrect entry.
timeout /t %Delay% 
goto unlockhd

:unlocknullhd
CLS & echo: & echo: & echo:
echo:
echo  Menu ^= Unlock xbox hard drive for nulled EEPROM console
echo:
set "entry="
if "%drive0%"=="PHYSICALDRIVE0  " echo  0. PHYSICALDRIVE0 - %drivename0%
if "%drive1%"=="PHYSICALDRIVE1  " echo  1. PHYSICALDRIVE1 - %drivename1%
if "%drive2%"=="PHYSICALDRIVE2  " echo  2. PHYSICALDRIVE2 - %drivename2%
if "%drive3%"=="PHYSICALDRIVE3  " echo  3. PHYSICALDRIVE3 - %drivename3%
if "%drive4%"=="PHYSICALDRIVE4  " echo  4. PHYSICALDRIVE4 - %drivename4%
if "%drive5%"=="PHYSICALDRIVE5  " echo  5. PHYSICALDRIVE5 - %drivename5%
echo:
echo  or press "Enter" to go back.
echo:
set /p entry=Enter Choice:
if "%drive0%"=="PHYSICALDRIVE0  " if "%entry%"=="0" call unlocknullhdd.bat a & goto menu
if "%drive1%"=="PHYSICALDRIVE1  " if "%entry%"=="1" call unlocknullhdd.bat b & goto menu
if "%drive2%"=="PHYSICALDRIVE2  " if "%entry%"=="2" call unlocknullhdd.bat c & goto menu
if "%drive3%"=="PHYSICALDRIVE3  " if "%entry%"=="3" call unlocknullhdd.bat d & goto menu
if "%drive4%"=="PHYSICALDRIVE4  " if "%entry%"=="4" call unlocknullhdd.bat e & goto menu
if "%drive5%"=="PHYSICALDRIVE5  " if "%entry%"=="5" call unlocknullhdd.bat f & goto menu
if "%entry%"=="" goto menu
echo Error: Incorrect entry.
timeout /t %Delay%
goto unlocknullhd

:checklockhd
CLS & echo: & echo: & echo:
echo:
echo  Menu ^= Check xbox hard drive lock status
echo:
set "entry="
if "%drive0%"=="PHYSICALDRIVE0  " echo  0. PHYSICALDRIVE0 - %drivename0%
if "%drive1%"=="PHYSICALDRIVE1  " echo  1. PHYSICALDRIVE1 - %drivename1%
if "%drive2%"=="PHYSICALDRIVE2  " echo  2. PHYSICALDRIVE2 - %drivename2%
if "%drive3%"=="PHYSICALDRIVE3  " echo  3. PHYSICALDRIVE3 - %drivename3%
if "%drive4%"=="PHYSICALDRIVE4  " echo  4. PHYSICALDRIVE4 - %drivename4%
if "%drive5%"=="PHYSICALDRIVE5  " echo  5. PHYSICALDRIVE5 - %drivename5%
echo:
echo  or press "Enter" to go back.
echo:
set /p entry=Enter Choice:
if "%drive0%"=="PHYSICALDRIVE0  " if "%entry%"=="0" call checklockhdd.bat a & goto menu
if "%drive1%"=="PHYSICALDRIVE1  " if "%entry%"=="1" call checklockhdd.bat b & goto menu
if "%drive2%"=="PHYSICALDRIVE2  " if "%entry%"=="2" call checklockhdd.bat c & goto menu
if "%drive3%"=="PHYSICALDRIVE3  " if "%entry%"=="3" call checklockhdd.bat d & goto menu
if "%drive4%"=="PHYSICALDRIVE4  " if "%entry%"=="4" call checklockhdd.bat e & goto menu
if "%drive5%"=="PHYSICALDRIVE5  " if "%entry%"=="5" call checklockhdd.bat f & goto menu
if "%entry%"=="" goto menu
echo Error: Incorrect entry.
timeout /t %Delay% 
goto checklockhd

:getadminwrites
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)
REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B
:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
   goto start
