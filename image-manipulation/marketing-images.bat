@echo off

setlocal enabledelayedexpansion

:: File:       marketing-images.bat
:: Author:     Julian Orchard [hello@julianorchard.co.uk]
:: Tag Added:  2022-02-11
:: Desciption: Uses ImageMagick to organise files in these directories

magick -version >nul 2>&1 && (

	for /r %%a in (oq\*) do (

	REM // ~nxa Gets File Name Only (the 'a' is %%a)
		set p=%%a
		set f=%%~nxa
	REM // ~dpa Gets The Directory Only
		set d=%%~dpa

	REM // fout
		set fout=  !f!

	REM // Update Output (original file name)
		<NUL set /p ="Formatting !f:~-9!"

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
	REM // settings copied from a helpful S/O answer
		magick convert -strip -interlace Plane -gaussian-blur 0.05 -quality 85% "!d!\!f!" "!d!lq-!f!"
		echo   !f! - converted to Low Quality

	REM // Messy, but works
		cd !d!
		cd ..\

	REM // Make \lq Dir, if it doesn't exist
		if not exist lq\ mkdir lq

	REM // Copy temp lq file to the new place
		copy /Y "!d!lq-!f!" "lq\!f!">NUL

	REM // Delete the temporary file
		del "!d!lq-!f!"
	)

) || (
	echo This script required ImageMagick to run! 
)
endlocal
