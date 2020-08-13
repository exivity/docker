# exivity/base

Multiarch Docker base image (Windows and Linux).

## Usage

```
docker run -it --rm exivity/base:latest
```

## Software

### Windows

Base image: _mcr.microsoft.com/windows/servercore:ltsc2019_

- PowerShell 7
- Node 12
- Visual C++ Redistributable for Visual Studio 2015
- Yarn 1
- Git for Windows 2

Notes: Ideally _mcr.microsoft.com/windows/nanoserver:1903_ would be used for a 
smaller footprint, but nginx for Windows is only available as a 32bit version
(see https://social.msdn.microsoft.com/Forums/en-US/7c30cb71-d449-4910-8bf5-f56023f7218e/nginx-in-nanoserver-container)

### Linux

Base image: _ubuntu:latest_

- zip
- unzip
