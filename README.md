# Android Debian Terminal Config

## Overview
An attempt to create a BASH script to configure the Android Debian terminal into a development environment.

## Prerequisites
Enable the Android Terminal. Some Android devices may lack support for this feature. <br>
Rough process: <br>
1. Go to Settings -> About Phone
2. Tap the Build Number until developer mode notification is recieved.
3. Go to Settings -> System -> Developer options
4. Enable "Linux development environment"
5. Wait for download and initial setup

## Files
* **files**, tertiary files to configure the environment. See README.md for files in directory.
* **configure.sh**, BASH script to configure environment.

## Bootstrap
TODO: Updated to main branch version before merging <br>
To bootstrap install download the script directly and run it:<br>
`wget https://raw.githubusercontent.com/ngrogg/android-debian-terminal-config/refs/heads/testing/configure.sh` <br> <br>
Executable bit is already set.
