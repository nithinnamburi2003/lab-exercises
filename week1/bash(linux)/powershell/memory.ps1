#define threshold
$threshold = 80

#function to get current Memoryusage
function Memusage {
    $Memusage = (Get-Counter -Counter "\Memory\% Committed bytes In use").CounterSamples.CookedValue
    return $Memusage
}

while ($true) {
    $Memusage = Memusage

    if ($Memusage -gt $threshold) {
            Write-Output "Alert: Memory usage is greater than threshold,Memory usage is: $Memusage%"
    }else{
            Write-Output "Memory utilization is in limit,Current memory usage is $Memusage%"
}
Start-Sleep -Seconds 45
}
