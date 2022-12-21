# General Information
## Project Name: 
Get-DiskSpace
## Purpose: 
Quickly get free and used disk space from one or more remote machines in a format that I like.
## Author: 
Tyler Tilton
## Published
10/31/2022
# Description
The command takes in a remote machine name or names (cast to an arry) and a drive letter and outputs the following:
```
PSComputerName Description             Used                Free
-------------- -----------             ----                ----
SV1             Data                    15259.4007720947    1124.41172790527
```
The Computers parameter and the Drive parameter must be specified.
# Usage
```
Get-DiskSpace -Computers SV1 -Drive D

Get-DiskSpace -Computers SV1,SV2 -Drive C
```
