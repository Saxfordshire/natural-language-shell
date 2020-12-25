#! /bin/bash
printf "%s\n" "Welcome to NLS! The installation will begin soon."
rm -rf $HOME/"Natural Language Shell"
printf "%s\n" "Verifying dependencies..."
printf "%s" "autoinstall: checking Git installation"
if ! command -v git &> /dev/null; then
    printf "%s\n" ", done."
    printf "%s" "autointall: installing Git"
    if [[ "$OSTYPE" == "darwin"* ]]; then
        if command -v brew &> /dev/null; then
            brew install git
            printf "%s\n" ", done."
        elif ! command -v brew &> /dev/null; then
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
            brew install git
            printf "%s\n" ", done."
        else
            printf "%s\n" ", error!"
            printf "%s\n" "autoinstall: unable to install Git for Mac. Please follow the instructions at https://git-scm.com/download/mac"
        fi
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if command -v apk &> /dev/null; then 
            apk add git
            printf "%s\n" ", done."
        elif command -v apt-get &> /dev/null; then
            sudo apt-get install git
            printf "%s\n" ", done."
        elif command -v brew &> /dev/null; then
            brew install git
            printf "%s\n" ", done."
        elif command -v dnf &> /dev/null; then
            sudo dnf install git
            printf "%s\n" ", done."
        elif command -v emerge &> /dev/null; then
            sudo emerge --ask --verbose dev-vcs/git
            printf "%s\n" ", done."
        elif command -v nix-env &> /dev/null; then
            sudo nix-env -i git
            printf "%s\n" ", done."
        elif command -v pacman &> /dev/null; then
            sudo pacman -S git
            printf "%s\n" ", done."
        elif command -v urpmi &> /dev/null; then
            sudo urpmi git
            printf "%s\n" ", done."
        elif command -v yum &> /dev/null; then
            sudo yum install git
            printf "%s\n" ", done."
        elif command -v zypper &> /dev/null; then
            sudo zypper install git
            printf "%s\n" ", done."
        else
            printf "%s\n" ", error!"
            printf "%s\n" "autoinstall: unable to install Git for Linux. Please follow the instructions at https://git-scm.com/download/linux"
        fi
    elif [[ "$OSTYPE" == "FreeBSD"* ]]; then
        if command -v zypper &> /dev/null; then
            sudo zypper install git
            printf "%s\n" ", done."
        else
            printf "%s\n" ", error!"
            printf "%s\n" "autoinstall: unable to install Git for FreeBSD. Please follow the instructions at https://git-scm.com/download/linux"
        fi
    elif [[ "$OSTYPE" == "solaris"* ]]; then
        if command -v pkgutil &> /dev/null; then
            sudo pkgutil -i git
            printf "%s\n" ", done."
        elif command -v pkg &> /dev/null; then
            sudo pkg install developer/versioning/git
            printf "%s\n" ", done."
        else
            printf "%s\n" ", error!"
            printf "%s\n" "autoinstall: unable to install Git for Solaris. Please follow the instructions at https://git-scm.com/download/linux"
        fi
    elif [[ "$OSTYPE" == "openbsd"* ]]; then
        if command -v pkg_add &> /dev/null; then
            sudo pkg_add git
            printf "%s\n" ", done."
        else
            printf "%s\n" ", error!"
            printf "%s\n" "autoinstall: unable to install Git for OpenBSD. Please follow the instructions at https://git-scm.com/download/linux"
        fi
    else
        printf "%s\n" ", error!"
        printf "%s\n" "autoinstall: unable to install Git. Please follow the instructions at https://git-scm.com/download"
    fi
else
    printf "%s\n" ", done."
fi
printf "%s" "autoinstall: checking Go installation"
if ! command -v git &> /dev/null; then
    printf "%s\n" ", done."
    printf "%s" "autointall: installing Go"
    if [[ "$OSTYPE" == "darwin"* ]]; then
        if command -v brew &> /dev/null; then
            brew install go
            printf "%s\n" ", done."
        elif ! command -v brew &> /dev/null; then
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
            brew install go
            printf "%s\n" ", done."
        else
            printf "%s\n" ", error!"
            printf "%s\n" "autoinstall: unable to install Go for Mac. Please follow the instructions at https://git-scm.com/download/mac"
        fi
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if command -v apk &> /dev/null; then 
            apk add go
            printf "%s\n" ", done."
        elif command -v apt-get &> /dev/null; then
            sudo apt-get install go
            printf "%s\n" ", done."
        elif command -v brew &> /dev/null; then
            brew install go
            printf "%s\n" ", done."
        elif command -v dnf &> /dev/null; then
            sudo dnf install go
            printf "%s\n" ", done."
        elif command -v emerge &> /dev/null; then
            sudo emerge --ask --verbose dev-vcs/git
            printf "%s\n" ", done."
        elif command -v nix-env &> /dev/null; then
            sudo nix-env -i go
            printf "%s\n" ", done."
        elif command -v pacman &> /dev/null; then
            sudo pacman -S go
            printf "%s\n" ", done."
        elif command -v urpmi &> /dev/null; then
            sudo urpmi go
            printf "%s\n" ", done."
        elif command -v yum &> /dev/null; then
            sudo yum install go
            printf "%s\n" ", done."
        elif command -v zypper &> /dev/null; then
            sudo zypper install go
            printf "%s\n" ", done."
        else
            printf "%s\n" ", error!"
            printf "%s\n" "autoinstall: unable to install Git for Linux. Please follow the instructions at https://git-scm.com/download/linux"
        fi
    elif [[ "$OSTYPE" == "FreeBSD"* ]]; then
        if command -v zypper &> /dev/null; then
            sudo zypper install go
            printf "%s\n" ", done."
        else
            printf "%s\n" ", error!"
            printf "%s\n" "autoinstall: unable to install Git for FreeBSD. Please follow the instructions at https://git-scm.com/download/linux"
        fi
    elif [[ "$OSTYPE" == "solaris"* ]]; then
        if command -v pkgutil &> /dev/null; then
            sudo pkgutil -i go
            printf "%s\n" ", done."
        elif command -v pkg &> /dev/null; then
            sudo pkg install developer/versioning/go
            printf "%s\n" ", done."
        else
            printf "%s\n" ", error!"
            printf "%s\n" "autoinstall: unable to install Git for Solaris. Please follow the instructions at https://git-scm.com/download/linux"
        fi
    elif [[ "$OSTYPE" == "openbsd"* ]]; then
        if command -v pkg_add &> /dev/null; then
            sudo pkg_add go
            printf "%s\n" ", done."
        else
            printf "%s\n" ", error!"
            printf "%s\n" "autoinstall: unable to install Git for OpenBSD. Please follow the instructions at https://git-scm.com/download/linux"
        fi
    else
        printf "%s\n" ", error!"
        printf "%s\n" "autoinstall: unable to install Git. Please follow the instructions at https://git-scm.com/download"
    fi
else
    printf "%s\n" ", done."
fi
printf "%s" "autoinstall: checking Python 3 installation"
if ! command -v python3 &> /dev/null
then
    printf "%s\n" "autoinstall: Python 3 could not be found, it isn't required"
    printf "%s\n" "             but consider installing Python 3 for additional"
    printf "%s\n" "             functionality." 
fi
printf "%s\n" ", done."
git clone https://github.com/Saxfordshire/natural-language-shell.git $HOME/"Natural Language Shell" --depth 1
printf "%s" "Building Go package (your password may be required)"
$(cd $HOME/"Natural Language Shell" && go build -o /usr/local/bin/nls)
printf "%s\n" ", done."
printf "%s" "Removing build files"
rm -rf $HOME/"Natural Language Shell"
printf "%s\n" ", done."
printf "%s\n" "Installation complete! Type \`nls --help\` for tips on getting started."
