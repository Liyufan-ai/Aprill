@echo off
setlocal
cd /d "%~dp0"
if exist "C:\aism" (
  echo C:\aism already exists. Preserve or rename it first.
  pause
  exit /b 2
)
set "AISM_TRANSFER_ARCHIVE=%~dp0aism-reconstructed.zip"
copy /b /y "aism.part001"+"aism.part002"+"aism.part003"+"aism.part004"+"aism.part005"+"aism.part006"+"aism.part007" "%AISM_TRANSFER_ARCHIVE%" >nul
if errorlevel 1 (
  echo Cannot combine the archive parts.
  pause
  exit /b 1
)
powershell.exe -NoProfile -Command "$ErrorActionPreference='Stop'; if(Test-Path -LiteralPath 'C:\aism'){throw 'C:\aism already exists. Preserve or rename it before continuing.'}; $h=(Get-FileHash -LiteralPath $env:AISM_TRANSFER_ARCHIVE -Algorithm SHA256).Hash; if($h -ne '90e65258a47869c0433cbf9f91f63fe4881a4d8e36dbf0a835151b5ed06c75a8'){throw 'Archive checksum mismatch.'}; Expand-Archive -LiteralPath $env:AISM_TRANSFER_ARCHIVE -DestinationPath 'C:\' -ErrorAction Stop; if(!(Test-Path -LiteralPath 'C:\aism\package.json')){throw 'Extraction verification failed.'}; Write-Host 'Ready: C:\aism'; Start-Process -FilePath 'C:\aism'"
if errorlevel 1 (
  echo Transfer failed. The existing C:\aism folder was not intentionally replaced.
  pause
  exit /b 1
)
echo Open C:\aism to watch or edit your video.
pause
endlocal
