$Move=@()
$Today = Get-Date -Format "dd-MMM-yy"
$Folder = "C:\Users\$env:USERNAME\MovedFiles\$Today"
$File = New-Item -Path "C:\Users\$env:USERNAME\DesktopFileCount.txt" -ItemType file -ErrorAction SilentlyContinue
$CurrFileCount = Get-ChildItem "C:\Users\$env:USERNAME\Desktop\" | Measure-Object | %{$_.Count}
$PrevFileCount = Get-Content -Path "C:\Users\$env:USERNAME\DesktopFileCount.txt"

if($CurrFileCount -gt $PrevFileCount) {

    if(!(Test-Path $Folder)){
        New-Item -Path $Folder -ItemType directory
    }

    $Files = Get-ChildItem "C:\Users\$env:USERNAME\Desktop\" -Recurse -Force -Exclude *.exe, *.ico, *.WS, *.ws, *.url, *.lnk
    foreach($i in $Files){
        if($i.mode -match "h"){
            $split=$i.Attributes -split(', ')
            $join=($split | where{$_ -ne "Hidden"}) -join(', ')
            if($join -eq ""){
                $i.Attributes = [System.IO.FileAttributes]::Normal
            }
            else{
                $i.Attributes = $join
            }
        }
        $Move = $Move+$i.fullname
        $Dest = $Folder,$i.Directory.Name -join('\')
            if(!(Test-Path $Dest)){
                New-Item -Path $Dest -ItemType directory
            }
        
        Move-Item $i.fullname -Destination $Dest 
    
    }
    
    Get-ChildItem "C:\Users\$env:USERNAME\Desktop\" | Measure-Object | %{$_.Count} | Out-File C:\Users\$env:USERNAME\DesktopFileCount.txt

}
