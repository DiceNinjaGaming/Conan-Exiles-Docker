Import-Module /scripts/Server-Tools/Server-Tools.psm1 -Force
$serverLauncherPath=(Join-Path '/app/server' 'ConanSandboxServer.exe')

Start-Sleep 10 # Delay initial startup to give the updater time to start

While (RunServer)
{
  If (-Not (UpdateRunning))
  {
    if (Test-Path $serverLauncherPath)
    {
      $args=""
      Copy-Configs
      Configure-Server
      & screen xvfb-run --auto-servernum --server-args='-screen 0 640x480x24:32' wine $serverLauncherPath -log
    } # if (Test-Path $serverLauncherPath)
  }
  else
  {
    Start-Sleep 5
  } # If (-Not (UpdateRunning)
} # While (RunServer)