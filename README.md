# dockerperf

To see volume mapping overhead on mac and windows, please following the steps below.

#### Prereqs:
1. Dotnet SDK: https://www.microsoft.com/net/core#windows
2. Install Docker on Mac / Docker for Windows on Windows.


#### Steps:

1. Clone this repo
2. Open console, go to the root of the repo
3. Install bower globally

  ```
  npm install -g bower
  ```
4. Run restore

  ```
  dotnet restore
  ```
5. Publish the application

  ```
  dotnet publish src/DockerPerf -c Release
  ```
6. Build images for both non-volume-mapped image and the volume-mapped image

  ```
  docker-compose -f src/DockerPerf/bin/Release/netcoreapp1.0/publish/docker-compose.yml build
  docker-compose -f src/DockerPerf/bin/Release/netcoreapp1.0/publish/docker-compose.volume.mapped.yml build
  ```

7. On Windows machine, execute TestWindows.ps1 in a powershell window
  On Mac, execute TestMac.sh in a console window
