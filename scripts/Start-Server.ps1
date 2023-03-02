Import-Module /scripts/Server-Tools/Server-Tools.psm1 -Force
$serverLauncherPath=(Join-Path '/app/server' 'ConanSandboxServer.exe')

Start-Sleep 10 # Delay initial startup to give the updater time to start
$copyConfigs = $true

While (RunServer)
{
  If (-Not (UpdateRunning))
  {
    if (Test-Path $serverLauncherPath)
    {
      $args=""
      
      # We only want to copy the configs the first time the container starts
      if ($copyConfigs)
      {
        Copy-Configs
        Configure-Server
        $copyConfigs = $false
      }
      & screen xvfb-run --auto-servernum --server-args='-screen 0 640x480x24:32' wine $serverLauncherPath -log
    } # if (Test-Path $serverLauncherPath)
  }
  else
  {
    Start-Sleep 5
  } # If (-Not (UpdateRunning)
} # While (RunServer)