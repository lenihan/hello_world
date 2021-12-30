# hello_world
Simple crossplatform (Windows/Linux/Mac) demo apps

* Cmake
* Qt
* OpenSceneGraph
* ImGUI
* Magnum
* Bazel

## Screen Shots

### Windows app

* Visual Studio 2022 running Windows app
![image](https://user-images.githubusercontent.com/22015149/144485403-76ae0007-62c4-4b5f-987a-719321bf7b72.png)

* Visual Studio 2022 debugging Windows app
![image](https://user-images.githubusercontent.com/22015149/144520344-bca0f5da-ee2b-4aad-bbd4-a3ff08d4f08a.png)

* Visual Studio 2022 debugging Windows app, tracing into Qt
![image](https://user-images.githubusercontent.com/22015149/144520688-aa1c50a4-e4ed-421a-8cf8-a0cd735c55b0.png)

### Linux app

* Visual Studio 2022 running Linux app
![image](https://user-images.githubusercontent.com/22015149/144484910-8b9af52a-d450-41e8-b30d-2bb8b434c22d.png)

* Visual Studio 2022 debugging Linux app
![image](https://user-images.githubusercontent.com/22015149/144484611-9213a9d2-7d06-42f6-b14f-84f9c6ae4047.png)

* Visual Studio 2022 debugging Linux app, tracing into Qt
![image](https://user-images.githubusercontent.com/22015149/144484126-6237c9ad-cbe0-4353-8bee-663565517e3f.png)


## Setup

The setup script uses PowerShell 7+.

### Install PowerShell 7+ on Windows

If you do not have `winget` at command prompt, install it by downloading "App Installer" from Microsoft Store: 
<https://www.microsoft.com/en-us/p/app-installer/9nblggh4nns1?activetab=pivot:overviewtab>

```sh
winget install --silent Microsoft.Powershell
```

### Install PowerShell 7+ on Ubuntu 20.04

From <https://docs.microsoft.com/en-us/powershell/scripting/install/install-ubuntu?view=powershell-7.1>

```sh
# Download
wget https://github.com/PowerShell/PowerShell/releases/download/v7.1.5/powershell_7.1.5-1.ubuntu.20.04_amd64.deb

# Install the downloaded package
sudo dpkg -i powershell_7.1.5-1.ubuntu.20.04_amd64.deb

# Resolve missing dependencies and finish the install (if necessary)
sudo apt-get install -f

# Update powershell
sudo apt-get install powershell
```

### Run setup script

```powershell
~/src/hello_world/scripts/setup.ps1
```

#### WSL

To allow Windows and WSL to use same source and third party directory structure, run setup.ps1 in WSL from Windows location:

```powershell
iex "/mnt/c/Users/$env:LOGNAME/src/hello_world/scripts/setup.ps1"
```

## Build

### Windows

### WSL

```powershell
# generate build files
/home/david/.vs/cmake/bin/cmake -G "Ninja"   -DCMAKE_BUILD_TYPE:STRING="Debug" -DCMAKE_INSTALL_PREFIX:PATH="/mnt/c/Users/david/src/hello_world/out/install/WSL-GCC-Debug"  /mnt/c/Users/david/src/hello_world/CMakeLists.txt

# build hello_qt
cd /mnt/c/Users/david/src/hello_world/out/build/WSL-GCC-Debug
/home/david/.vs/cmake/bin/cmake --build /mnt/c/Users/david/src/hello_world/out/build/WSL-GCC-Debug --target hello_qt --config Debug
```

### Ubuntu

## Run

## Debug
