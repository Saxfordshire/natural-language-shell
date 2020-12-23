# Natural Language Shell

The Natural Language Shell project uses language you naturally use to simplify and [decomplicate](https://en.wiktionary.org/wiki/decomplicate) the command line.

Whether you are a beginner and just getting started with the command line or familiar but forgot a specific command sequence, NLS only needs everyday English to understand what you want to do.

## Installation

### Requirements

* A Unix or Unix-like operating system is required (macOS, Linux, BSD)
* `curl` should be installed
* `git` is required ([Download Git](https://www.git-scm.com/downloads))
* The Go language is required ([Download Go](https://golang.org/dl/))
* Python 3 is optional but required for some features ([Download Python 3](https://www.python.org/downloads/))

### Basic Installation

Run one of the following commands in your terminal to install NLS. You may need to enter your password.

Main branch (recommended):

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Saxfordshire/natural-language-shell/main/autoinstall.sh)"
```

## Usage

Run NLS using the `nls` command. Type `nls` and your request on the same line after the command prompt.

```sh
[nls@computer ~]$ nls what time is it
nls: running: date "+%X"
14:30:14

[nls@computer ~]$ nls what is the size of file.txt
nls: running: ls -lah file.txt | awk '{print $5}'
4.2K

[nls@computer ~]$ nls show my version of git
nls: running: git --version
git version 2.29.2
```

NLS interprets your request and runs the appropriate shell commands.

## Supported requests

> NLS supports multiple ways of phrasing the same request

### Date & Time

* What time is it
* What is today's date
* What month is it
* What day is it

### Files

* What is the size of file.txt

### Git

> Prefix `git` to requests utilizing Git

* Show repository status
* Prepare file.txt for commit

> Type your commit comment after the colon "`:`"

* Commit files with a comment: Updated React version
* Push commits to remote

### Programs & Software

* What is my version of npm

> Python 3 is required to run the local web server

* Start a testing server on port 8000

### User

* What is my username
* What is my full name
* What is my IP address

## Uninstalling

To uninstall NLS, simply run the following command and enter your password when prompted.

```sh
sudo rm /usr/local/bin/nls
```

## License

The Natural Language Shell is released under the [MIT License](https://github.com/Saxfordshire/natural-language-shell/blob/main/LICENSE.md).

## About

The Natural Language Shell project was originally created by [Saxfordshire](https://github.com/Saxfordshire).

NLS is heavily inspired by the now-unmaintained [Betty](https://github.com/pickhardt/betty) project.
