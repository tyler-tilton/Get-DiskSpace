<#
.Synopsis
   Quickly get free and used disk space from one or more remote machines in a format that I like.
.DESCRIPTION
   Quickly get free and used disk space from one or more remote machines in a format that I like.
.EXAMPLE
   Get-DiskSpace -Computers SV1 -Drive D
.EXAMPLE
   Get-DiskSpace -Computers SV1,SV2 -Drive C
.INPUTS
   Target computer name in a string or computers in a comma seperated array and a string for the disk drive letter.
.OUTPUTS
   System object listing the computer(s) drive, and free/used space.
#>

function Get-DiskSpace {
    param (
        [Parameter(Mandatory = $true)]
        [string] $Drive,
        
        [Parameter(Mandatory = $true)]
        [array] $Computers
    )
    
    Foreach ($target in $Computers) {
        Invoke-Command -ComputerName $target -ArgumentList $Drive { 
            param($Drive) 
            Get-PSDrive -Name $Drive 
        } | Select-Object PSComputerName, Description, @{Name = "Used"; Expression = { $_.Used / 1GB } }, @{Name = "Free"; Expression = { $_.Free / 1GB } }
    }
}
