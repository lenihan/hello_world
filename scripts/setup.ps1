# Install prerequisites, builds third party libraries

function install_prerequisites {
    Write-Host "Install prerequisites" -ForegroundColor Cyan
    if ($IsWindows)
    {
        # Windows 10: install winget by downloading App Installer from Microsoft Store
        #             https://www.microsoft.com/en-us/p/app-installer/9nblggh4nns1?activetab=pivot:overviewtab

        # NOTE: Run as Admin to avoid prompts
        $ids = 
            "Microsoft.VisualStudio.2022.Community", 
            "Git.Git", 
            "Microsoft.VisualStudioCode", 
            "Kitware.Cmake"
        $installed = winget list
        foreach ($id in $ids) {
            write-host "$id not found, installing" -forgroundcolor red
            $installed = ($installed -match $id).count -eq 1
            if (!$installed) {
                winget install --silent $id
            }
        }
    }
    elseif ($IsLinux) {

        # sudo apt update
        
        # for WSL build from Visual Studio
        sudo apt install -y g++
        sudo apt install -y gdb 
        sudo apt install -y make 
        sudo apt install -y ninja-build 
        sudo apt install -y rsync 
        sudo apt install -y zip
        
        # for sdl2 (needed for Magnum)
        sudo apt-get install -y pkg-config

        # for opengl (needed for Magnum)
        sudo apt-get install -y libgl1-mesa-dev

        # needed by osg
        sudo apt-get install -y gperf

        # Needed by qt5
        sudo apt-get -y install bison
        sudo apt-get -y install python

        # Needed for qt5 https://doc.qt.io/qt-5/linux-requirements.html
        sudo apt-get -y install libfontconfig1-dev
        sudo apt-get -y install libfreetype6-dev
        sudo apt-get -y install libx11-dev
        sudo apt-get -y install libx11-xcb-dev
        sudo apt-get -y install libxext-dev
        sudo apt-get -y install libxfixes-dev
        sudo apt-get -y install libxi-dev
        sudo apt-get -y install libxrender-dev
        sudo apt-get -y install libxcb1-dev
        sudo apt-get -y install libxcb-glx0-dev
        sudo apt-get -y install libxcb-keysyms1-dev
        sudo apt-get -y install libxcb-image0-dev
        sudo apt-get -y install libxcb-shm0-dev
        sudo apt-get -y install libxcb-icccm4-dev
        sudo apt-get -y install libxcb-sync0-dev
        sudo apt-get -y install libxcb-xfixes0-dev
        sudo apt-get -y install libxcb-shape0-dev
        sudo apt-get -y install libxcb-randr0-dev
        sudo apt-get -y install libxcb-render-util0-dev
        sudo apt-get -y install libxcd-xinerama-dev
        sudo apt-get -y install libxkbcommon-dev
        sudo apt-get -y install libxkbcommon-x11-dev

        # Needed for qt5 https://github.com/microsoft/vcpkg/blob/master/scripts/azure-pipelines/linux/provision-image.sh
        sudo apt-get -y install libxcb-util0-dev
        sudo apt-get -y install libxcb-xinerama0-dev
        sudo apt-get -y install libxcb-xkb-dev
        sudo apt-get -y install libxcb-xinput-dev
    }

    # Make 
    Write-Host "NOTE: May need to start new terminal to get updated PATH" -ForegroundColor Yellow
}

function build_third_party_dependencies {
    Write-Host "Build third party libraries" -ForegroundColor Cyan
    
    $ROOT_DIR = "$PSScriptRoot/.."
    Push-Location $ROOT_DIR
    mkdir $ROOT_DIR\third_party -Force | Out-Null
    Set-Location $ROOT_DIR/third_party
    
    git clone https://github.com/Microsoft/vcpkg.git
    Set-Location $ROOT_DIR\third_party\vcpkg
    git checkout 
    
    if ($IsWindows) {
        $triplet = "x64-windows"   # dynamic library, dynamic CRT
        ./bootstrap-vcpkg.bat -disableMetrics
        
        # To avoid path length issues building qt5 (qtdeclarative), make root as short as possible
        # From https://github.com/microsoft/vcpkg/issues/20604#issuecomment-939091795
        subst k: $ROOT_DIR\third_party\vcpkg
        Set-Location k:
    } elseif ($IsLinux) {
        $triplet = "x64-linux"
        ./bootstrap-vcpkg.sh -disableMetrics
    }
    ./vcpkg --triplet=$triplet install fontconfig    # needed by osg for reading fonts
    ./vcpkg --triplet=$triplet install imgui                            # Windows: ~22 s, WSL:    ~2 m, Ubuntu:  ~9 s
    ./vcpkg --triplet=$triplet install magnum                           # Windows:  ~3 m, WSL:   ~22 m, Ubuntu:  ~2 m
    ./vcpkg --triplet=$triplet install osg[tools,plugins,examples]      # Windows: ~30 m, WSL:  ~1.1 h, Ubuntu: ~15 m
    ./vcpkg --triplet=$triplet install qt5                              # Windows: ~60 m, WSL: ~10.2 h, Ubuntu: ~54 m
    Pop-Location
}

install_prerequisites
build_third_party_dependencies
