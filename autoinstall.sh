#! /bin/bash
printf "%s\n" "Welcome to NLS! The installation will begin soon."
rm -rf $HOME/"Natural Language Shell"
printf "%s\n" "Verifying dependencies..."
printf "%s" "autoinstall: verifying Git installation"
if ! command -v git &> /dev/null; then
    printf "%s\n" ", done."
    printf "%s\n" "autointall: installing Git..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        if command -v brew &> /dev/null; then
            brew install git
        elif ! command -v brew &> /dev/null; then
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
            brew install git
        else
            printf "%s\n" "autoinstall: unable to install Git for Mac. Please follow the instructions at https://git-scm.com/download/mac"
        fi
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if command -v apk &> /dev/null; then 
            apk add git
        elif command -v apt-get &> /dev/null; then
            sudo apt install git
        elif command -v apt-get &> /dev/null; then
            sudo apt-get install git
        elif command -v brew &> /dev/null; then
            brew install git
        elif command -v dnf &> /dev/null; then
            sudo dnf install git
        elif command -v emerge &> /dev/null; then
            sudo emerge --ask --verbose dev-vcs/git
        elif command -v nix-env &> /dev/null; then
            sudo nix-env -i git
        elif command -v pacman &> /dev/null; then
            sudo pacman -S git
        elif command -v urpmi &> /dev/null; then
            sudo urpmi git
        elif command -v yum &> /dev/null; then
            sudo yum install git
        elif command -v zypper &> /dev/null; then
            sudo zypper install git
        else
            printf "%s\n" "autoinstall: unable to install Git for Linux. Please follow the instructions at https://git-scm.com/download/linux"
        fi
    elif [[ "$OSTYPE" == "FreeBSD"* ]]; then
        if command -v zypper &> /dev/null; then
            sudo zypper install git
        else
            printf "%s\n" "autoinstall: unable to install Git for FreeBSD. Please follow the instructions at https://git-scm.com/download/linux"
        fi
    elif [[ "$OSTYPE" == "solaris"* ]]; then
        if command -v pkgutil &> /dev/null; then
            sudo pkgutil -i git
        elif command -v pkg &> /dev/null; then
            sudo pkg install developer/versioning/git
        else
            printf "%s\n" "autoinstall: unable to install Git for Solaris. Please follow the instructions at https://git-scm.com/download/linux"
        fi
    elif [[ "$OSTYPE" == "openbsd"* ]]; then
        if command -v pkg_add &> /dev/null; then
            sudo pkg_add git
        else
            printf "%s\n" "autoinstall: unable to install Git for OpenBSD. Please follow the instructions at https://git-scm.com/download/linux"
        fi
    else
        printf "%s\n" "autoinstall: unable to install Git. Please follow the instructions at https://git-scm.com/download"
    fi
else
    printf "%s\n" ", done."
fi
printf "%s" "autoinstall: verifying Go installation"
if ! command -v go &> /dev/null; then
    printf "%s\n" ", done."
    printf "%s\n" "autoinstall: installing Go..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        if command -v brew &> /dev/null; then
            brew install go
        elif ! command -v brew &> /dev/null; then
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
            brew install go
        else
            printf "%s\n" "autoinstall: unable to install Go for Mac. Please follow the instructions at https://git-scm.com/download/mac"
        fi
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Ordered alphabetically with universal package managers first, then 
        # distro-specific pacage managers after to avoid potential conflicts
        if command -v snap &> /dev/null; then
            sudo snap install go --classic
        elif command -v apk &> /dev/null; then 
            apk add go
        elif command -v apt-get &> /dev/null; then
            sudo apt-get install go
        elif command -v brew &> /dev/null; then
            brew install go
        elif command -v dnf &> /dev/null; then
            sudo dnf install go
        elif command -v emerge &> /dev/null; then
            sudo emerge --ask --verbose dev-vcs/git
        elif command -v nix-env &> /dev/null; then
            sudo nix-env -i go
        elif command -v pacman &> /dev/null; then
            sudo pacman -S go
        elif command -v urpmi &> /dev/null; then
            sudo urpmi go
        elif command -v yum &> /dev/null; then
            sudo yum install go
        elif command -v zypper &> /dev/null; then
            sudo zypper install go
        else
            printf "%s\n" "autoinstall: unable to install Git for Linux. Please follow the instructions at https://git-scm.com/download/linux"
        fi
    elif [[ "$OSTYPE" == "FreeBSD"* ]]; then
        if command -v zypper &> /dev/null; then
            sudo zypper install go
        else
            printf "%s\n" "autoinstall: unable to install Git for FreeBSD. Please follow the instructions at https://git-scm.com/download/linux"
        fi
    elif [[ "$OSTYPE" == "solaris"* ]]; then
        if command -v pkgutil &> /dev/null; then
            sudo pkgutil -i go
        elif command -v pkg &> /dev/null; then
            sudo pkg install developer/versioning/go
        else
            printf "%s\n" "autoinstall: unable to install Git for Solaris. Please follow the instructions at https://git-scm.com/download/linux"
        fi
    elif [[ "$OSTYPE" == "openbsd"* ]]; then
        if command -v pkg_add &> /dev/null; then
            sudo pkg_add go
        else
            printf "%s\n" "autoinstall: unable to install Git for OpenBSD. Please follow the instructions at https://git-scm.com/download/linux"
        fi
    else
        printf "%s\n" "autoinstall: unable to install Git. Please follow the instructions at https://git-scm.com/download"
    fi
else
    printf "%s\n" ", done."
fi
printf "%s" "autoinstall: verifying Python 3 installation"
if ! command -v go &> /dev/null; then
    printf "%s\n" ", done."
    printf "%s\n" "autoinstall: installing Python 3..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        if command -v brew &> /dev/null; then
            brew install python3
        elif ! command -v brew &> /dev/null; then
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
            brew install python3
        else
            printf "%s\n" "autoinstall: unable to install Python 3 for Mac. Please follow the instructions at https://git-scm.com/download/mac"
        fi
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Ordered alphabetically with universal package managers first, then 
        # distro-specific pacage managers after to avoid potential conflicts
        elif command -v apk &> /dev/null; then 
            apk add python3
        elif command -v apt-get &> /dev/null; then
            sudo apt-get install python3
        elif command -v brew &> /dev/null; then
            brew install python3
        elif command -v dnf &> /dev/null; then
            sudo dnf install python3
        elif command -v emerge &> /dev/null; then
            sudo emerge --ask --verbose dev-vcs/python3
        elif command -v nix-env &> /dev/null; then
            sudo nix-env -i python3
        elif command -v pacman &> /dev/null; then
            sudo pacman -S python3
        elif command -v urpmi &> /dev/null; then
            sudo urpmi python3
        elif command -v yum &> /dev/null; then
            sudo yum install python3
        elif command -v zypper &> /dev/null; then
            sudo zypper install python3
        else
            printf "%s\n" "autoinstall: unable to install Python 3 for Linux. Please follow the instructions at https://git-scm.com/download/linux"
        fi
    elif [[ "$OSTYPE" == "FreeBSD"* ]]; then
        if command -v zypper &> /dev/null; then
            sudo zypper install python3
        else
            printf "%s\n" "autoinstall: unable to install Python 3 for FreeBSD. Please follow the instructions at https://git-scm.com/download/linux"
        fi
    elif [[ "$OSTYPE" == "solaris"* ]]; then
        if command -v pkgutil &> /dev/null; then
            sudo pkgutil -i python3
        elif command -v pkg &> /dev/null; then
            sudo pkg install developer/versioning/python3
        else
            printf "%s\n" "autoinstall: unable to install Python 3 for Solaris. Please follow the instructions at https://git-scm.com/download/linux"
        fi
    elif [[ "$OSTYPE" == "openbsd"* ]]; then
        if command -v pkg_add &> /dev/null; then
            sudo pkg_add python3
        else
            printf "%s\n" "autoinstall: unable to install Python 3 for OpenBSD. Please follow the instructions at https://git-scm.com/download/linux"
        fi
    else
        printf "%s\n" "autoinstall: unable to install Python 3. Please follow the instructions at https://git-scm.com/download"
    fi
else
    printf "%s\n" ", done."
fi
printf "%s\n" ", done."
git clone https://github.com/Saxfordshire/natural-language-shell.git $HOME/"Natural Language Shell" --depth 1
printf "%s\n" "Building Go package (your password may be required)..."
$(cd $HOME/"Natural Language Shell" && sudo go build -o /usr/local/bin/nls)
printf "%s" "Removing build files"
rm -rf $HOME/"Natural Language Shell"
printf "%s\n" ", done."
printf "%s\n" "Installation complete! Type \`nls --help\` for tips on getting started."
