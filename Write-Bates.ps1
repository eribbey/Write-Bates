﻿<#
.SYNOPSIS
  Adds Bates numbering to the names of native files

.DESCRIPTION
  Takes a single directory with native files, confirms the prefix, digits, and starting number, and then writes a console log of processed files.

.PARAMETER Directory
    Enter full path to directory with files to be renamed

.PARAMETER Prefix
    Enter prefix to prepend to Bates number

.PARAMETER Length
    Enter number of digits that determine the amount of leading zeroes

.PARAMETER StartRange
    Enter first Bates number value, without any leading zeroes

.INPUTS
  Native files in a single directory

.OUTPUTS
  Bates number appended to all files in directory
  
.NOTES
  Version:        1.0
  Author:         Evan Ribbey
  Creation Date:  4/15/20
  Purpose/Change: Initial script release
  
.EXAMPLE
  Write-Bates -Directory C:\nativefiles -Prefix EXC -Length 8 -StartRange 4258
#>
param(
  [Parameter(Mandatory)]
  [string]$Directory,
  [string]$Prefix,
  [int]$Length,
  [string]$StartRange
)
$batesPad = $StartRange.PadLeft($Length, '0')
Write-Host "-----------------"
Write-Host "Native file directory: $Directory"
Write-Host "Bates prefix: $Prefix"
Write-Host "Starting Bates number: " $batesPad
Write-Host "-----------------"
$confirm = Read-Host "Are the above details correct? Y/N: "
if ($confirm -eq "Y") {
  $files = Get-ChildItem -Path $Directory
  $count = 0
  ForEach ($file in $files) {
    $currentFileName = $file.Name
    $batesPad = $StartRange.PadLeft($Length, '0')
    $newFileName = $prefix + "$batesPad" + "-" + $currentFileName
    Rename-Item -Path $file.FullName -NewName $newFileName
    Write-Host "$currentFileName renamed to $newFileName"
    $startInt = $StartRange -as [int]
    $startInt++
    $StartRange = $startInt -as [string]
    $count++
  }
  Write-Host "Bates numbering completed for $count native files"
}
else {
  break
}
