$backupLocation = '/app/backups'
$tempLocation = '/tmp/backups'
$serverLocation = '/app/server'

function RunSteamCMD()
{
  /steam/steamcmd.sh +@sSteamCmdForcePlatformType windows +force_install_dir "$serverLocation" +login anonymous +app_update $STEAM_APPID $UPDATES_STEAMCMD_ARGS +quit
}

function RunUpdate()
{
  return (($UPDATES_ENABLED) -or (-not (Test-Path /app/server/*)))
}

# ----------------- Main Section  -----------------

while (RunUpdate)
{
  RunSteamCMD
  Start-Sleep ($UPDATES_INTERVAL * 60)
} # while (RunUpdate)
