$adb = 'C:\Users\DELL\AppData\Local\Android\sdk\platform-tools\adb.exe'
$device = 'emulator-5556'
for ($i = 0; $i -lt 120; $i++) {
  & $adb -s $device shell getprop sys.boot_completed 2>$null | Out-String | % { $_.Trim() } | Tee-Object -Variable boot
  if ($LASTEXITCODE -eq 0 -and $boot -eq '1') {
    Write-Output 'BOOT_COMPLETED'
    exit 0
  }
  Start-Sleep -Seconds 2
}
Write-Output 'BOOT_TIMEOUT'
exit 1
