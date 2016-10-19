# dockerperf

To see volume mapping overhead on mac and windows, please following the steps below.

#### Prereqs:
1. Dotnet SDK: https://www.microsoft.com/net/core#windows
2. Install Docker for Mac/Windows.
3. On Mac, install gnomon utility

  ```
  npm install -g gnomon
  ```

#### Steps:

1. Clone this repo
2. Open console, go to the root of the repo
3. On Windows, run the following command in a powershell window

  ```
  .\Build.ps1
  ```

  On Linux, run the following command in a console window

  ```
  .\Build.sh
  ```

4. On Windows machine, execute the following commands in a powershell window:

  ```
  # to test w/o volume mapping
  .\TestWindows

  # to test w/ volume mapping
  .\TestWindows -v
  ```
  On Mac, execute the following commands in a console window

  ```
  # to test w/o volume mapping
  .\TestMac

  # to test w/ volume mapping
  .\TestMac -v
  ```