$defaultConfigDirectory='/app/configs/'
$destinationConfigDirectory=(Join-Path '/app/server' 'ConanSandbox/Saved/Config/WindowsServer')
$configFiles=@{
  'Game.ini'=$destinationConfigDirectory
  'Engine.ini'=$destinationConfigDirectory
  'ServerSettings.ini'=$destinationConfigDirectory
}

function Copy-Configs
{
  foreach ($file in $configFiles.GetEnumerator())
  {
    $sourceFile = (Join-Path $defaultConfigDirectory $file.Name)
    if (-Not (Test-Path $file.Value)) { mkdir -p $($file.Value) } # New-Item does really weird things in here
    Copy-Item $sourceFile $file.Value
  }
}

function Update-ConfigFile
{
  
}

function Configure-Server
{
  
}