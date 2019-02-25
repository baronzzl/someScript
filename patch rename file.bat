@echo off     
echo *******batch rename file in current path*******   
echo.
echo.
 
 
set /p filename=input file prefix name:
IF "%filename%"=="" set "filename=%%~ni"
 
set /p suffix=please input file type:
IF "%suffix%"==""   echo.file type can't be none &goto error
IF NOT EXIST *.%suffix% echo.no this type file &goto error
 
setlocal ENABLEDELAYEDEXPANSION
for /r %%i in (.) do (
        set n=10000
        for /f "delims=" %%a in (' dir /b "%%i\*.%suffix%" 2^>nul ') do (
                set /a n+=1
                ren "%%i\%%a" "%filename%"!n:~1!%%~xa
        )
)
 
echo. &pause
exit
 
:error
echo. &pause
