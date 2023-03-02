# Conan Exiles Docker
A Docker image for hosting a Conan Exiles server.

# IMPORTANT INFO FOR FORKS
This section contains information related to creating forked repos for specific games. This section should be
removed after all the steps have been taken.

## Dockerfile Changes
1. Update the following environment variables:
    - STEAM_APPID
    - SERVER_PROCESS_NAME
    - SERVER_PORT
2. If using Wine, uncomment the section to install it
3. If not using mcRcon, remove the section that installs it

## Config-Tools.ps1 changes
1. Update the `Copy-Configs` function to move the config file(s) to the proper location(s)

## Start-UpdateService.ps1 changes
1. If necessary, adjust the arguments in the `RunSteamCMD` function

## Update-ConfigFiles.ps1 changes
1. Update the config file updates as necessary


# System Requirements
| Name | Description |
| - | - |
| Processor | 3.0+ GHz, Intel Core 2 Duo 6850 or better |
| Memory | 8GB |
| Storage | 35+ GB |
| Internet Connection | Broadband internet connection. Hosting from home will require the ability to configure port forwarding |

# Important folders
| Name | Description |
| - | - |
| /app/server | Game server files |
| /app/backups | Backup files |
| /app/logs | Logs for the various processes |

# Environment Variables
## General
| Name | Default | Description |
| ---------------- | ------- | ----------- |
| SERVER_NAME | Default Server Name | The name to be displayed in the server list |
| SERVER_PASSWORD | DefaultPassword | The password to be used for the server |
| SERVER_PORT | 1234 | The port to be used by the server |
| TZ | Etc/UTC | Time zone for the server. A full list can be [found here](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones)
| FILE_UMASK | 022 | umask value to use for configs, backups, and server files. [This article](https://www.digitalocean.com/community/tutorials/linux-permissions-basics-and-how-to-use-umask-on-a-vps) has a good explanation on permissions and how the umask works
| UPDATES_ENABLED | true | Whether to check for updates or not |
| UPDATES_INTERVAL | 15 | Number of minutes between update checks |
| UPDATES_WHILE_USERS_CONNECTED | false | Whether or not to run updates when users are connected. If set to true,
it can cause connected users to lose progress |
| UPDATES_STEAMCMD_ARGS | | Additional arguments to be passed to the steamcmd command |
| RCON_PORT | 25575 | RCON port, if available for the server
| RCON_PASSWORD | ChangeThisPasswordIfUsingRCON | Password to use if exposing RCON |
| RCON_MAX_KARMA | 60 | 

## Backups
| Name | Default | Description |
| ---------------- | ------- | ----------- |
| BACKUPS_ENABLED | true | Whether or not backups should be enabled |
| BACKUPS_MAX_AGE | 3 | Backups more than this many days old will be removed |
| BACKUPS_MAX_COUNT | 0 | Maximum number of backups to keep. 0 keeps all backups |
| BACKUPS_INTERVAL | 360 | Number of minutes between backups |


