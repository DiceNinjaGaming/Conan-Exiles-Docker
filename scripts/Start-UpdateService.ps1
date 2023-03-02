$backupLocation = '/app/backups'
$tempLocation = '/tmp/backups'
$serverLocation = '/app/server'

$updatesEnabled=$env:UPDATES_ENABLED
[int]$updatesInterval=$env:UPDATES_INTERVAL
[int]$steamAppId=$env:STEAM_APPID
[string]$steamcmdArgs=$env:UPDATES_STEAMCMD_ARGS

function RunSteamCMD()
{
  AddUpdateLock
  $args="+@sSteamCmdForcePlatformType windows +force_install_dir '$serverLocation' +login anonymous +app_update $steamAppId $steamcmdArgs +quit"
  $invocation = "-Command & {/steam/steamcmd.sh $args}"
  Start-Process pwsh -ArgumentList $invocation -NoNewWindow -Wait -Passthru
  Write-Output "Done updating"
  RemoveUpdateLock
}

function RunUpdate()
{
  return (($updatesEnabled) -or (-not (Test-Path /app/server/*)))
}

# ----------------- Main Section  -----------------

Import-Module /scripts/Server-Tools/Server-Tools.psm1 -Force
while (RunUpdate)
{
  if (InstalledVersion -ne LatestVersion)
  {
    Write-Output "Installed version doesn't match latest version, running update"
    RunSteamCMD
  }
  RemoveUpdateLock
  Start-Sleep ($updatesInterval * 60)
} # while (RunUpdate)
