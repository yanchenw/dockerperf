# dockerperf

To see volume mapping overhead on mac and windows, please following the steps below.

#### Prereqs:
1. Dotnet SDK: https://www.microsoft.com/net/core#windows
2. Install Docker on Mac / Docker for Windows on Windows.
3. On Mac, install gnomon utility

  ```
  npm install -g gnomon
  ```

#### Steps:

1. Clone this repo
2. Open console, go to the root of the repo
3. Install bower globally

  ```
  npm install -g bower
  ```
4. On Windows, run .\Build.ps1 in a powershell window
   On Linux, run .\Build.sh in a console window

5. On Windows machine, execute the following commands in a powershell window:

  ```
  .\TestWindows
  .\TestWindows -v
  ```
  On Mac, execute the following commands in a console window

  ```
  .\TestMac
  .\TestMac -v
  ```