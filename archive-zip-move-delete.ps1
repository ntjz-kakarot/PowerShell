Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force

#Get all event log files that begin with "Archive"
$archive = Get-ChildItem -Path env:SYSTEMROOT\System32\Winevt\Logs\Archive-*.evtx -Force

#For each event log file that was taken from the Get-ChildItem command do the below
foreach($i in $archive){

  $path = $i.VersionInfo.FileName
  $dest = "D:\DestinationFolder\" + $i.Name.Split(".")[0] + ".zip"

try{

  #This will compress the event log file and move it to the desired location.
  #Note that Compress-Archive only supports, files upto 2GB
  #The 2GB eventlog file will be compressed down to ~160MB file
  
  Compress-Archive -Path $path -CompressionLevel Optimal -Destination $dest -ErrorAction Stop

  Remove-Item -Path $path

}catch{
    Write-host $Error[0]
    $Error[0] >> D:\DestinationFolder\errorLog
    }

}
