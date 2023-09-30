# PowerShell Script to download and install Office using ODT

# Define paths
$odtPath = "$env:USERPROFILE\Downloads\ODT"
$configXmlPath = "$odtPath\MyConfig.xml"

# Check if ODT folder exists, if not create it
if (-not (Test-Path $odtPath)) {
    New-Item -Path $odtPath -ItemType Directory
}

# Download Office Deployment Tool
Invoke-WebRequest -Uri "https://download.microsoft.com/download/2/7/A/27AF1BE6-DD20-4CB4-B154-EBAB8A7D4A7E/officedeploymenttool_13426-20308.exe" -OutFile "$odtPath\ODTInstaller.exe"

# Execute ODT installer to extract content
Start-Process "$odtPath\ODTInstaller.exe" -ArgumentList "/extract:$odtPath" -Wait

# Create MyConfig.xml with specified configuration
$configXmlContent = @"
<Configuration>
   <Add OfficeClientEdition="64" Channel="PerpetualVL2019">
      <Product ID="ProPlus2021Volume">
         <Language ID="en-us" />
         <ExcludeApp ID="Access" />
         <ExcludeApp ID="Publisher" />
         <ExcludeApp ID="OneNote" />
         <ExcludeApp ID="Outlook" />
         <ExcludeApp ID="Teams" />
         <ExcludeApp ID="Skype" />
         <ExcludeApp ID="Groove" />
         <ExcludeApp ID="OneDrive" />
         <ExcludeApp ID="Lync" />
      </Product>
   </Add>
   <Display Level="Full" AcceptEULA="TRUE" />
</Configuration>
"@
$configXmlContent | Out-File -Path $configXmlPath -Encoding utf8

# Run ODT to download Office
Start-Process "$odtPath\setup.exe" -ArgumentList "/download $configXmlPath" -Wait

# Install Office using ODT
Start-Process "$odtPath\setup.exe" -ArgumentList "/configure $configXmlPath" -Wait

# Cleanup
Remove-Item "$odtPath\ODTInstaller.exe" -Force
