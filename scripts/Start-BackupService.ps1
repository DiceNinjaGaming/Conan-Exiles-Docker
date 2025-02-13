$backupLocation = '/app/backups'
$saveLocation = '/app/server/ConanSandbox/Saved'
$backupsEnabled=$env:BACKUPS_ENABLED
$backupsInterval=$env:BACKUPS_INTERVAL

function RunBackups()
{
  return ($backupsEnabled)
}

While (RunBackups)
{
  if (Test-Path (Join-Path $saveLocation "*"))
  {
    $backupFile = Join-Path $backupLocation "backup-$((Get-Date).tostring("yyyyMMdd_HHmmss")).zip"
    zip -r $backupFile $saveLocation
  } # if (Test-Path $saveLocation)
  Start-Sleep ($backupsInterval * 60)
} # While (RunBackups)
