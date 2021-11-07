# hello_world
Simple crossplatform (Windows/Linux) demo apps

* Cmake
* Qt
* OpenSceneGraph
* ImGUI
* Magnum
* Bazel

## Prerequisites

### Windows

```sh
# Windows 10: install winget by downloading App Installer from Microsoft Store
#             https://www.microsoft.com/en-us/p/app-installer/9nblggh4nns1?activetab=pivot:overviewtab

# NOTE: Run as Admin to avoid prompts
winget install --silent Microsoft.Powershell
winget install --silent Microsoft.VisualStudio.2022.Community-Preview
winget install --silent Git.Git
winget install --silent Microsoft.VisualStudioCode
```
#### Ubuntu 20.04

```sh
# From https://docs.microsoft.com/en-us/powershell/scripting/install/install-ubuntu?view=powershell-7.1

# download
wget https://github.com/PowerShell/PowerShell/releases/download/v7.1.5/powershell_7.1.5-1.ubuntu.20.04_amd64.deb

# Install the downloaded package
sudo dpkg -i powershell_7.1.5-1.ubuntu.20.04_amd64.deb

# Resolve missing dependencies and finish the install (if necessary)
sudo apt-get install -f

# Update powershell
sudo apt-get install powershell
```
## Get source

Open pwsh prompt
cd to source code directory (i.e. ~/src)

```powershell
git clone https://github.com/lenihan/hello_world
```

## Setup ~/src/hello_world/third_party/vcpkg

Open pwsh prompt

```powershell
cd ~/src/hello_world
mkdir third_party
cd third_party
git clone https://github.com/Microsoft/vcpkg.git
./vcpkg/bootstrap-vcpkg -disableMetrics
$triplet = $IsWindows ? "x64-windows" : "x64-linux"

./vcpkg/vcpkg --triplet=$triplet install qt5     # ~50 min
./vcpkg/vcpkg --triplet=$triplet install osg     # ~26 min
./vcpkg/vcpkg --triplet=$triplet install imgui   # ~11 sec
./vcpkg/vcpkg --triplet=$triplet install magnum  # ~3min


```



