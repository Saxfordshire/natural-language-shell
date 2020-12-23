#! /bin/sh
printf "%s\n" "Welcome to NLS! The installation will begin soon."
printf "%s\n" "Verifying dependencies..."
printf "%s" "autoinstall: checking Git installation"
if [ ! command -v git &> /dev/null ]
then
    echo "autointall: Git could not be found, please install Git"
    exit
fi
printf "%s\n" ", done."
printf "%s" "autoinstall: checking Go installation"
if [ ! command -v go &> /dev/null ]
then
    printf "%s\n" "autoinstall: Go could not be found, please install Go"
    exit
fi
printf "%s\n" ", done."
printf "%s" "autoinstall: checking Python 3 installation"
if [ ! command -v python3 &> /dev/null ]
then
    printf "%s\n" "autoinstall: Python 3 could not be found, it isn't required"
    printf "%s\n" "             but consider installing Python 3 for additional"
    printf "%s\n" "             functionality."
    exit
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
