# exivity/docker

Docker base images used at Exivity.

## tags

### :latest

Multiarch image containing both Windows and Linux images.

### :windows

_mcr.microsoft.com/windows/servercore:1903_

- PowerShell 6.2.0
- Node 10.15.3
- Visual C++ Redistributable for Visual Studio 2015
- Yarn 1.13.0
- Git for Windows 2.20.1

notes:
- previously, we used _mcr.microsoft.com/windows/nanoserver:1903_ but this turned out to be incompatible with nginx, see https://social.msdn.microsoft.com/Forums/en-US/7c30cb71-d449-4910-8bf5-f56023f7218e/nginx-in-nanoserver-container

### :linux

_ubuntu:latest_

- zip
- unzip
