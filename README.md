# Conan Exiles Docker
A Docker image for hosting a Conan Exiles server.

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
| TZ | Etc/UTC | Time zone for the server. A full list can be [found here](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones)
| FILE_UMASK | 022 | umask value to use for configs, backups, and server files. [This article](https://www.digitalocean.com/community/tutorials/linux-permissions-basics-and-how-to-use-umask-on-a-vps) has a good explanation on permissions and how the umask works
| UPDATES_ENABLED | true | Whether to check for updates or not |
| UPDATES_INTERVAL | 15 | Number of minutes between update checks |
| UPDATES_STEAMCMD_ARGS | | Additional arguments to be passed to the steamcmd command |

## Backups
| Name | Default | Description |
| ---------------- | ------- | ----------- |
| BACKUPS_ENABLED | true | Whether or not backups should be enabled |
| BACKUPS_MAX_AGE | 3 | Backups more than this many days old will be removed |
| BACKUPS_MAX_COUNT | 0 | Maximum number of backups to keep. 0 keeps all backups |
| BACKUPS_INTERVAL | 360 | Number of minutes between backups |


