$ErrorActionPreference = 'Continue'
$log = Join-Path $PWD 'flutter-run.log'
$env:Path = 'C:\flutter\bin;C:\Users\DELL\AppData\Local\Android\sdk\platform-tools;C:\Users\DELL\AppData\Local\Android\sdk\emulator;' + $env:Path
Set-Location 'C:\Users\DELL\STUDY-CIRCLE-APP-PROJECT'
Write-Output 'Starting flutter run' | Tee-Object -FilePath $log -Append
flutter run -d emulator-5556 --verbose 2>&1 | Tee-Object -FilePath $log -Append
