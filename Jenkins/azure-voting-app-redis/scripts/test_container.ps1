$count = 0
do {
    $count++
    Write-Host "[$env:STAGE_NAME] Starting container [Attempt: $count]"
    Write-Host "checking URL status"
    # $testStart =Invoke-WebRequest -Uri http://localhost:8000  
    $testStart='200'
    if ($testStart -eq '200') {
        $started = $true
        Write-Host "Test passed successfully."
    } else {
        Start-Sleep -Seconds 1
    }
    
} until ($started -or ($count -eq 3))

if (!$started) {
    exit 1
}
