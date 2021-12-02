# hello_world
Simple crossplatform (Windows/Linux) demo apps

* Cmake
* Qt
* OpenSceneGraph
* ImGUI
* Magnum
* Bazel

## Screen Shots

* Visual Studio 2022 running Windows app
![image](https://user-images.githubusercontent.com/22015149/144476924-674fc479-e9ab-4c7f-a503-b4bb9b258da8.png)

* Visual Studio 2022 running Linux app
![image](https://user-images.githubusercontent.com/22015149/144477651-11777077-9afe-46ba-8951-1dffd476bae0.png)

* Visual Studio 2022 debugging Linux app
![image](https://user-images.githubusercontent.com/22015149/144477889-0fb48726-7186-4002-884e-70477c162fe9.png)

* Visual Studio 2022 debugging Linux app, tracing into Qt
![image](https://user-images.githubusercontent.com/22015149/144478023-b82a7659-3b2a-42c4-8432-b313e9487bb6.png)

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
