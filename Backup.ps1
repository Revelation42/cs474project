Write-Host "Begin Copying Process"

try
{
    If (Test-Path  C:\Users\grays\Documents\Capstone\Copyto\$((Get-Date -Format "yyyy_MM_dd").ToString())) 
    {
        Write-Host "Directory exists"
    }
    else 
    {
        
mkdir C:\Users\grays\Documents\Capstone\Copyto\$((Get-Date -Format "yyyy_MM_dd").ToString())
    Write-Host "Directory Made"
    }
        If (Test-Path  C:\Users\grays\Documents\Capstone\Copyto\$((Get-Date -Format "yyyy_MM_dd").ToString())\Record.txt) 
        {
            Write-Host "Record Exists"
            Add-Content C:\Users\grays\Documents\Capstone\Copyto\$((Get-Date -Format "yyyy_MM_dd").ToString())\Record.txt -Value (Get-Date -Format "yyyy-MM-dd  HH:mm:ss")
        }
        else
        {
    New-Item C:\Users\grays\Documents\Capstone\Copyto\$((Get-Date -Format "yyyy_MM_dd").ToString())\Record.txt
    Write-Host "Record Made"
    Set-Content C:\Users\grays\Documents\Capstone\Copyto\$((Get-Date -Format "yyyy_MM_dd").ToString())\Record.txt -Value (Get-Date -Format "yyyy-MM-dd  HH:mm:ss")            
    Write-Host "Record Set"
        }
        Copy-Item -Path "C:\Users\grays\Documents\Capstone\PullFrom_Parent\" -Destination "C:\Users\grays\Documents\Capstone\Copyto\$((Get-Date -Format "yyyy_MM_dd").ToString())" -Recurse
        Write-Host "Item Copied"
        
#$Folder1 = Get-ChildItem "C:\Users\grays\Documents\Capstone\PullFrom_Parent\"
#$Folder2 = Get-ChildItem "C:\Users\grays\Documents\Capstone\Copyto\"
#$date = Get-Date - format "yyyyMMdd"
#$datestr = $date.ToString("yyyyMMdd")
#Get-Content C:\Users\grays\Documents\Capstone\Copyto\$((Get-Date -Format "yyyy_MM_dd").ToString())\Record.txt
#Compare-Object $Folder1 $Folder2
}
Finally
    {
        Get-Content C:\Users\grays\Documents\Capstone\Copyto\$((Get-Date -Format "yyyy_MM_dd").ToString())\Record.txt
    }
