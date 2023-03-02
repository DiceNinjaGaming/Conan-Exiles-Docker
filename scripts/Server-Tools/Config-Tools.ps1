$defaultConfigDirectory='/app/configs/'
$destinationConfigDirectory=(Join-Path '/app/server' '/path/to/config/folder')
$configFiles=@{
  'Game.ini'=(Join-Path $destinationConfigDirectory 'Game.ini')
  'Engine.ini'=(Join-Path $destinationConfigDirectory 'Engine.ini')
  'Server.ini'=(Join-Path $destinationConfigDirectory 'Server.ini')
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