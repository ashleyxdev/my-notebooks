Write-Host "==============================="
Write-Host "   Jupyter Notebook Downloader"
Write-Host "==============================="
Write-Host ""

# === Define file lists and dependencies ===
$repoBase = "https://raw.githubusercontent.com/ashleyxdev/my-scripts/master"

# Map notebooks to their required CSV files
$files = @(
    @{ id = 1; name = "linear-regression.ipynb"; csv = "" },
    @{ id = 2; name = "naive-bayes.ipynb"; csv = "document.csv" },
    @{ id = 3; name = "svm.ipynb"; csv = "" },
    @{ id = 4; name = "kmeans.ipynb"; csv = "" },
    @{ id = 5; name = "random-forest.ipynb"; csv = "" },
    @{ id = 6; name = "boosting.ipynb"; csv = "" },
    @{ id = 7; name = "taxi-problem.ipynb"; csv = "" },
    @{ id = 8; name = "tic-tac-toe.ipynb"; csv = "" }
)

# === Display all notebook options ===
Write-Host "Available Jupyter Notebooks:`n"
foreach ($f in $files) {
    if ($f.csv -ne "") {
        Write-Host "$($f.id). $($f.name) (requires: $($f.csv))"
    } else {
        Write-Host "$($f.id). $($f.name)"
    }
}

Write-Host ""
$choice = Read-Host "Enter your choice (1-$($files.Count))"

$selected = $files | Where-Object { $_.id -eq [int]$choice }

if (-not $selected) {
    Write-Host "Invalid choice! Exiting."
    exit
}

# === Download selected notebook ===
$notebookUrl = "$repoBase/$($selected.name)"
Write-Host "`nDownloading $($selected.name)..."
Invoke-WebRequest -Uri $notebookUrl -OutFile $selected.name
Write-Host "Notebook download complete!"

# === Ask for CSV file ===
if ($selected.csv -ne "") {
    Write-Host "`nThis notebook uses a dataset: $($selected.csv)"
    $downloadCsv = Read-Host "Do you want to download this CSV file now? (Y/n)"
    if ($downloadCsv -eq "" -or $downloadCsv -match "^[Yy]$") {
        $csvUrl = "$repoBase/$($selected.csv)"
        Write-Host "`nDownloading $($selected.csv)..."
        Invoke-WebRequest -Uri $csvUrl -OutFile $selected.csv
        Write-Host "CSV download complete!"
    } else {
        Write-Host "Skipped CSV download."
    }
} else {
    Write-Host "`nThis notebook does not require any CSV file."
}

Write-Host "`nAll done!"


# Write-Host "==============================="

# Write-Host " Python Script Downloader"

# Write-Host "==============================="

# Write-Host ""


# Write-Host "1. Download linear-regression.ipynb"

# Write-Host "2. Download naive-bayes.py"

# Write-Host "3. Download svm.py"

# Write-Host "4. Download kmeans.py"

# Write-Host "5. Download random-forest.py"

# Write-Host "6. Download boosting.py"

# Write-Host "7. Download taxi-problem.ipynb"

# Write-Host "8. Download tic-tac-toe.ipynb"

# Write-Host ""



# $choice = Read-Host "Enter your choice (1-8)"



# switch ($choice) {

#     1 { $file = "linear-regression.ipynb"}

#     2 { $file = "naive-bayes.py" }

#     3 { $file = "svm.py" }

#     4 { $file = "kmeans.py" }

#     5 { $file = "random-forest.py" }

#     6 { $file = "boosting.py" }

#     7 { $file = "taxi-problem.ipynb" }

#     8 { $file = "tic-tac-toe.ipynb" }

#     default {

#         Write-Host "Invalid choice!"

#         exit

#     }

# }



# $url = "https://raw.githubusercontent.com/ashleyxdev/my-scripts/master/$file"



# Write-Host "`nDownloading $file..."

# Invoke-WebRequest -Uri $url -OutFile $file

# Write-Host "Download complete!"

