params([switch]$v = $false)

# Checks if the URL is responding
function WaitForUrl ([string]$uri) {
    Write-Host "Opening site $uri"
    $status = 0
    $count = 0

    #Check if the site is available
    while ($status -ne 200) {
        try {
            Write-Verbose "Trying to connect to $uri ($count/120)"
            $response = Invoke-WebRequest -Uri $uri -Headers @{"Cache-Control"="no-cache";"Pragma"="no-cache"} -Verbose:$false
            $status = [int]$response.StatusCode
        }
        catch [System.Net.WebException] { }
        if($status -ne 200) {
            $count += 1
        }
    }
    Write-Host "Connected successfully."
}

if ($v) {
    Write-Host "Testing w/ volume mapping:"
    measure-command {
        docker-compose -f src/DockerPerf/bin/Release/netcoreapp1.0/publish/docker-compose.volume.mapped.yml up -d
        WaitForUrl http://localhost:35002
    }

    docker-compose -f src/DockerPerf/bin/Release/netcoreapp1.0/publish/docker-compose.volume.mapped.yml down --remove-orphans
} else {
    Write-Host "Testing w/o volume mapping:"
    measure-command {
        docker-compose -f src/DockerPerf/bin/Release/netcoreapp1.0/publish/docker-compose.yml up -d
        WaitForUrl http://localhost:35001
    }

    docker-compose -f src/DockerPerf/bin/Release/netcoreapp1.0/publish/docker-compose.yml down --remove-orphans
}
