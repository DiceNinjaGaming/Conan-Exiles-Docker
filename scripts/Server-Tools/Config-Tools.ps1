$defaultConfigDirectory='/app/default-configs/'
$destinationConfigDirectory=(Join-Path '/app/server' 'ConanSandbox\Saved\Config\WindowsServer')

function Copy-Configs
{
  Copy-Item (Join-Path $defaultConfigDirectory '*') -Destination $destinationConfigDirectory
}