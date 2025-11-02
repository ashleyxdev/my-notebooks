Write-Host "==============================="
Write-Host " Python Script Downloader"
Write-Host "==============================="
Write-Host ""
Write-Host "1. Download script1.py"
Write-Host "2. Download script2.py"
Write-Host "3. Download script3.py"
Write-Host ""

$choice = Read-Host "Enter your choice (1-3)"

switch ($choice) {
    1 { $file = "script1.py" }
    2 { $file = "script2.py" }
    3 { $file = "script3.py" }
    default {
        Write-Host "Invalid choice!"
        exit
    }
}

$url = "https://raw.githubusercontent.com/ashleyxdev/my-scripts/main/$file"

Write-Host "`nDownloading $file..."
Invoke-WebRequest -Uri $url -OutFile $file
Write-Host "Download complete!"
