$ErrorActionPreference = 'Continue'
$log = Join-Path $PWD 'android-diag.txt'
Write-Output "Starting diagnostics" | Tee-Object -FilePath $log -Append
$env:Path = 'C:\flutter\bin;C:\Users\DELL\AppData\Local\Android\sdk\platform-tools;C:\Users\DELL\AppData\Local\Android\sdk\emulator;' + $env:Path
Write-Output '--- PATH CHECK ---' | Tee-Object -FilePath $log -Append
Get-Command flutter -ErrorAction SilentlyContinue | Format-List * | Tee-Object -FilePath $log -Append
Get-Command adb -ErrorAction SilentlyContinue | Format-List * | Tee-Object -FilePath $log -Append
Get-Command emulator -ErrorAction SilentlyContinue | Format-List * | Tee-Object -FilePath $log -Append
Write-Output '--- FLUTTER VERSION ---' | Tee-Object -FilePath $log -Append
flutter --version 2>&1 | Tee-Object -FilePath $log -Append
Write-Output '--- ADB DEVICES ---' | Tee-Object -FilePath $log -Append
adb devices -l 2>&1 | Tee-Object -FilePath $log -Append
Write-Output '--- BOOT STATUS ---' | Tee-Object -FilePath $log -Append
adb shell getprop sys.boot_completed 2>&1 | Tee-Object -FilePath $log -Append
Write-Output '--- INSTALL ATTEMPT ---' | Tee-Object -FilePath $log -Append
adb install -r build\app\outputs\flutter-apk\app-debug.apk 2>&1 | Tee-Object -FilePath $log -Append
