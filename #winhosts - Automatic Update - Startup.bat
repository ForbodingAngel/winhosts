ECHO OFF

set scriptpath=%CD%
MD "%appdata%\#winhosts"

if not exist "%appdata%\#winhosts\HOSTS" (
	copy HOSTS "%appdata%\#winhosts"
)

cls

ECHO Updating to the latest hosts file from: https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts
wget -O "%appdata%\#winhosts\hosts.txt" https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts --no-check-certificate
timeout /t 3

if exist "%appdata%\#winhosts\hosts.txt" (

	if exist "%appdata%\#winhosts\HOSTS" (
	
		fc /a "%appdata%\#winhosts\hosts.txt" "%appdata%\#winhosts\HOSTS"
		
	) else (
	
		echo .>> "%appdata%\#winhosts\HOSTS"
		fc "%appdata%\#winhosts\hosts.txt" "%appdata%\#winhosts\HOSTS"
		
	)
	
	if errorlevel 1 (
	
		del "%appdata%\#winhosts\HOSTS"
		cd "%appdata%\#winhosts"
		REM I wish I knew why ren bitches about a syntax error when renaming files not in it's own folder
		ren hosts.txt HOSTS
		cd "%scriptpath%"
		echo "%cd%"
		
		if exist "%appdata%\#winhosts\hosts.txt" (
			del "%appdata%\#winhosts\hosts.txt"
		)
		
		elevate "#winhosts - replace.bat"
		
	) else (
		
		if exist "%appdata%\#winhosts\hosts.txt" (
			del "%appdata%\#winhosts\hosts.txt"
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

	ECHO #WinHOSTS was unable to download the latest HOSTS file from https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts
	ECHO.
	ECHO Please make sure that your computer is connected to the internet, then try running #WinHOSTS again!
	timeout /t 10
	exit
	
)