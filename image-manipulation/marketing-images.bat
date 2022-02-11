@echo off

setlocal enabledelayedexpansion

:: File:       marketing-images.bat
:: Author:     Julian Orchard [hello@julianorchard.co.uk]
:: Tag Added:  2022-02-11
:: Desciption: Uses ImageMagick to organise files in these directories

for /r %%a in (oq\*) do (

REM // ~nxa Gets File Name Only (the 'a' is %%a)
	set p=%%a
	set f=%%~nxa

REM // Remove Brackets
		set f=!f:^(=!
		set f=!f:^)=!
		set f=!f: =-!

REM // JPG File Fix Cases
		set f=!f:^JPG=jpg!
		set f=!f:^jpeg=jpg!

REM // Rename .jpg File
		ren "!p!" "!f!"

REM // Use ImageMagick to Mirror into \lq Folder
		magick convert -strip -interlace Plane -gaussian-blur 0.05 -quality 85% !p! ..\lq-!f!

REM // Echo
		echo !f!
)

endlocal
