# Write-Bates
Add Bates numbering to native files with Powershell

## Description
With requests for native files becoming more prevalent in document productions, this script was developed to make the process of Bates numbering/stamping them easier. The content of native files cannot be altered with a Bates number. Therefore, Bates numbers are prepended to the original filenames to satisfy production requirements.

## Usage
Here is an example command that will prepend Bates numbers such as EXA000001,EXA000002, etc. to the names of files in C:\Production\Native Files\
```powershell
Write-Bates.ps1 -Directory "C:\Production\Native Files" -Prefix EXA -Length 6 -StartRange 1
```
The script automatically backs up the native files before applying the Bates number, and you can choose at the end of the process to remove the backup, or leave it. Before deleting the backup, check to make sure that the Bates numbering worked correctly.
