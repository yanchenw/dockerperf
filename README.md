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
6. Call docker-compose up for both non-volume-mapped image and the volume-mapped image

  ```
  docker-compose src/DockerPerf/bin/Release/netcoreapp1.0/publish/docker-compose.yml up --force-recreate --build -d
  docker-compose src/DockerPerf/bin/Release/netcoreapp1.0/publish/docker-compose.volume.mapped.yml up --force-recreate --build -d
  ```

  Now you have two running containers, the only difference is one have no volume mapping while the other one has the entire published application volume mapped to /app directory.
7. Execute bash in each of the running container, measure the web application start up time

  ```
  docker exec -it bash publish_dockerperf_1
  dotnet DockerPerf.dll | gnomon -t elapsed-total
  
  docker exec -it bash publish_dockerperf.volume.mapped_1
  dotnet DockerPerf.dll | gnomon -t elapsed-total
  ```

  You'll see the output as below:

  ```
  root@b3ece2a02047:/app# dotnet DockerPerf.dll | gnomon -t elapsed-total
   0.4105s   Hosting environment: Production
   0.4117s   Content root path: /app
   0.4122s   Now listening on: http://+:80
   3.4163s   Application started. Press Ctrl+C to shut down.
  ```
  The time before "Now listening on: http://+:80" will be the time spent to start the web server, in this case 0.4122s.


