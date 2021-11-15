# hello_world
Simple crossplatform (Windows/Linux) demo apps

* Cmake
* Qt
* OpenSceneGraph
* ImGUI
* Magnum
* Bazel

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