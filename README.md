# exivity/docker

Docker base images used at Exivity.

## tags

### :latest

Multiarch image containing both Windows and Linux images.

### :windows

_mcr.microsoft.com/windows/nanoserver:1803_

- PowerShell 6.2.0
- Node 10.15.3

_note: 1803 has a nasty time bug (https://github.com/moby/moby/issues/37283) but Travis doesn't support 1809 which would solve the issue (https://travis-ci.community/t/docker-hyperv-isolation-support-to-run-older-windows-images/1767)._

### :linux

_ubuntu:latest_

- zip
- unzip
