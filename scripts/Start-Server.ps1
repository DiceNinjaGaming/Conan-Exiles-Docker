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
        Write-Output 'Copying config files'
        Copy-Configs
        Write-Output 'Applying specified config changes (if any)'
        Configure-Server
        Write-Output 'Finished applying server configuration'
        $copyConfigs = $false
      }
      Write-Ouput 'Starting server'
      $env:DISPLAY=':99'
      $invocation = "-Command & {xvfb-run --auto-servernum --server-args='-screen 0 640x480x24:32' wine $serverLauncherPath -log}"
      Start-Process pwsh -ArgumentList $invocation -NoNewWindow -Wait -Passthru

      #xvfb-run --auto-servernum --server-args='-screen 0 640x480x24:32' exec wine $serverLauncherPath -log
      Write-Output 'Server exited'
    } # if (Test-Path $serverLauncherPath)
  }
  else
  {
    Start-Sleep 5
  } # If (-Not (UpdateRunning)
} # While (RunServer)