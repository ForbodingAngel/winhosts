echo off
cls
color 1f
set winhostsappdir=%~dp0
cd /d %winhostsappdir%
cd ..
cd ..
set winhostsbasedir=%CD%
cd /d %winhostsbasedir%

:: ------------EXTRA CODE TO CHANGE DIRECTORY-------------
echo %~n0%~x0 started from Directory: %~d0%~p0
%~d0
cd %~d0%~p0
:: -------------------------------------------------------

IF NOT EXIST "%winhostsbasedir%\data\HOSTS" GOTO noHostsFile
IF "%OS%"=="Windows_NT" GOTO HostsFile
IF EXIST %winbootdir%\HOSTS*.* ATTRIB +A -H -R -S %winbootdir%\HOSTS*.*>NUL
IF EXIST %winbootdir%\HOSTS.OLD DEL %winbootdir%\HOSTS.OLD>NUL
IF EXIST %winbootdir%\HOSTS REN %winbootdir%\HOSTS HOSTS.OLD>NUL
IF EXIST %winbootdir%\NUL COPY /Y HOSTS %winbootdir%>NUL
GOTO noHostsFile
:HostsFile
IF EXIST %windir%\SYSTEM32\DRIVERS\ETC\HOSTS*.* ATTRIB +A -H -R -S %windir%\SYSTEM32\DRIVERS\ETC\HOSTS*.*>NUL
IF EXIST %windir%\SYSTEM32\DRIVERS\ETC\HOSTS.OLD DEL %windir%\SYSTEM32\DRIVERS\ETC\HOSTS.OLD>NUL
IF EXIST %windir%\SYSTEM32\DRIVERS\ETC\HOSTS REN %windir%\SYSTEM32\DRIVERS\ETC\HOSTS HOSTS.OLD>NUL
IF EXIST %windir%\SYSTEM32\DRIVERS\ETC\NUL COPY /Y "%winhostsbasedir%\data\HOSTS" %windir%\SYSTEM32\DRIVERS\ETC>NUL
	echo.
	echo  ‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹
	echo  ›                                          ⁄ƒƒƒøﬁ
	echo  › THE HOSTS FILE IS NOW UPDATED            ≥ ˚ ≥ﬁ
	echo  ›                                          ¿ƒƒƒŸﬁ
	echo. ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ
	echo.
	echo.
	echo. Previous version saved and renamed to HOSTS.OLD
:noHostsFile
timeout /t 10
EXIT