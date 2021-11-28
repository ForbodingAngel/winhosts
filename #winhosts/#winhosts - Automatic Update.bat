ECHO OFF
set winhostsbasedir=%~dp0
cd /d %winhostsbasedir%
cd /d app\#winhosts
set winhostsappdir=%CD%
cd %winhostsbasedir%

cls

if not exist "%winhostsbasedir%\data\HOSTS" (
	copy "%winhostsbasedir%\app\defaultdata\HOSTS" "%winhostsbasedir%\data\"
)

cls
set /p URL=<"%winhostsbasedir%\data\HOSTS.#url"
ECHO Updating to the latest hosts file from: %URL%
cd /d %winhostsappdir%
wget -O "%winhostsbasedir%\data\hosts.txt" %URL% --no-check-certificate
cd /d %winhostsbasedir%
timeout /t 3

if exist "%winhostsbasedir%\data\hosts.txt" (

	if exist "%winhostsbasedir%\data\HOSTS" (
	
		fc /a "%winhostsbasedir%\data\hosts.txt" "%winhostsbasedir%\data\HOSTS"
		
	) else (
	
		echo .>> "%winhostsbasedir%\data\HOSTS"
		fc "%winhostsbasedir%\data\hosts.txt" "%winhostsbasedir%\data\HOSTS"
		
	)
	
	if errorlevel 1 (
	
		del "%winhostsbasedir%\data\HOSTS"
		cd /d "%winhostsbasedir%\data"
		REM I wish I knew why ren bitches about a syntax error when renaming files not in it's own folder
		ren hosts.txt HOSTS
		cd /d "%winhostsappdir%"
		REM echo "%cd%"
		
		if exist "%winhostsbasedir%\data\hosts.txt" (
			del "%winhostsbasedir%\data\hosts.txt"
		)
		
		elevate "%winhostsappdir%\#winhosts - replace.bat"
		
		exit
		
	) else (
		
		if exist "%winhostsbasedir%\data\hosts.txt" (
			del "%winhostsbasedir%\data\hosts.txt"
		)
	
		ECHO.
		ECHO /*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/
		ECHO The remote version of the Hosts file has not been updated so there is no need to update your local file
		ECHO Exiting #winhosts because there is no need to update the windows HOSTS file
		ECHO \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\
		timeout /t 10
		exit
		
	)
	
) else (

	ECHO #WinHOSTS was unable to download the latest HOSTS file from %URL%
	ECHO.
	ECHO Please make sure that your computer is connected to the internet, then try running #WinHOSTS again!
	timeout /t 10
	exit
	
)