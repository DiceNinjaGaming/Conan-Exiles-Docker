$defaultConfigDirectory='/app/configs/'
$destinationConfigDirectory=(Join-Path '/app/server' 'ConanSandbox/Saved/Config/WindowsServer')
$configFiles=@{
  'Game.ini'=(Join-Path $destinationConfigDirectory 'Game.ini')
  'Engine.ini'=(Join-Path $destinationConfigDirectory 'Engine.ini')
  'ServerSettings.ini'=(Join-Path $destinationConfigDirectory 'ServerSettings.ini')
}

function Copy-Configs
{
  foreach ($file in $configFiles.GetEnumerator())
  {
    $sourceFile = (Join-Path $defaultConfigDirectory $file.Name)
    Copy-Item $sourceFile $file.Value
  }
}

function Update-ConfigFile
{
  
}

function Configure-Server
{
  
}