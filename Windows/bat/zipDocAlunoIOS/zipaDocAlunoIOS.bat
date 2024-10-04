@echo off
setlocal enabledelayedexpansion

set "desktop=%USERPROFILE%\Desktop"
set "search_pattern=turma*"
set "zip_suffix=zipada"

for /D %%F in ("%desktop%\%search_pattern%") do (
    set "turma_folder=%%~nxF"
    set "zipped_folder=!turma_folder!!zip_suffix!"
    set "destination_directory=%desktop%\!zipped_folder!"

    if not exist "!destination_directory!" mkdir "!destination_directory!"

    echo Zipping contents inside %%F...

    for /D %%I in ("%%F\*") do (
        set "subfolder=%%~nxI"
        tar -a -c -f "!destination_directory!\!subfolder!.zip" -C "%%I" .
        echo Zipped "%%I" to "!destination_directory!\!subfolder!.zip"
    )

    echo All subfolders in %%F have been zipped and saved to "!destination_directory!".
)

echo Todos os documentos foram zipados e salvos em pastas como turma01zipada
pause