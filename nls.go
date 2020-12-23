package main

import (
	"flag"
	"fmt"
	"log"
	"os"
	"os/exec"
	"regexp"
	"strings"
	"unicode/utf8"
)

// These are the 4 functions used to evaluate incoming requests

func inputSniffer(pattern string, input string) string {
	r, _ := regexp.Compile("(?i)" + pattern)
	return r.FindString(input)
}

// func rawInputSniffer

func verifyCommand(cmd string) string {
	result, err := exec.Command("sh", "-c", cmd).Output()
	if err != nil {
		log.Fatal(err)
	}
	return string(result)
}

func execCommand(cmd string) {
	fmt.Println("nls: running:", cmd)
	result, err := exec.Command("sh", "-c", cmd).Output()
	fmt.Printf(string(result))
	if err != nil {
		log.Fatal(err)
	}
}

func execCatch(input string) {
	fmt.Println("nls: heard:", input)
	// using Println for `go run`, use Printf in `go build` versions
	fmt.Println("nls: please reword your request ")
	os.Exit(1)
}

// These are meta/documentation

func helpDoc() {
	fmt.Println("Natural Language Shell 0.1, a command line natural language interpreter")
	fmt.Println("Usage: nls [-h | --help] [-v | --version] [git] [<request>]")
	fmt.Println()
	fmt.Println("  -h, --help		Display this help documentation")
	fmt.Println("  -v, --version	Show version number")
	fmt.Println("  git 				Run git commands from NLS")
	fmt.Println()
	fmt.Println("Example requests:")
	fmt.Println("  nls whats my username")
	fmt.Println("  nls what is the size of <file>")
	fmt.Println("  nls what time is it")
	fmt.Println("  nls git show repository status")
	fmt.Println()
	fmt.Println("If you have any questions or feedback, please visit the nls GitHub page:")
	fmt.Println("  https://github.com/Saxfordshire/natural-language-shell")
}

func versionDoc() {
	fmt.Println("nls 0.1")
}

// Put all supported requests here

func evaluate(input string) {
	switch input {

	// Meta
	case inputSniffer("(i need|need|show)?\\s?(help|h)?\\s?(page)?", input):
		helpDoc()
	case inputSniffer("((whats|what is|show) (my|the|nls)?\\s?version\\s?(of nls)?|version|v)", input):
		versionDoc()

	// Date & Time
	case inputSniffer("((whats|what is)|what|show) (the time|time is it|(the )?current time)", input):
		execCommand("date \"+%X\"")
	case inputSniffer("(what|whats) (is todays date|todays date)?\\s?(the date|date is it)?", input):
		execCommand("date \"+%x\"")
	case inputSniffer("(((whats|what is)|show) the( current)? month|what month is it)", input):
		execCommand("date \"+%B\"")
	case inputSniffer("(what|whats) (day is it)?(is)?\\s?(todays day|the day)?", input):
		execCommand("date \"+%A\"")

	// Files
	case inputSniffer("((whats|what is)|show) (the )?size (of)? .*\\..*", input):
		r, _ := regexp.Compile("\\S*\\..*")
		r.FindString(input)
		execCommand("ls -lah " + r.FindString(input) + " | awk '{print $5}'")

	// Git
	case inputSniffer("^(git) (add|prepare|stage) (\\w+)(.\\w+)( to | for )?(commit|staging( area)?)?", input):
		r, _ := regexp.Compile("\\w+\\.\\w+")
		execCommand("git add " + r.FindString(input))
	case inputSniffer("^(git) (show |whats |what is )?\\s?(the |repository )?status(\\s?of (this|my) repository)?", input):
		execCommand("git status")
	case inputSniffer("(?:(^(git) commit (files )?(with|with a|and add) (a )?(comment(:)?|message(:)?) (saying(:)? )))(.*)$", input):
		r, _ := regexp.Compile("[^:]*$")
		_, i := utf8.DecodeRuneInString(r.FindString(input))
		execCommand("git commit -m \"" + r.FindString(input)[i:] + "\"")
	case inputSniffer("^(git) push( commit(s)?| (all)? committed files)?( to)?( remote)?( repository| GitHub)?", input):
		execCommand("git push")

	// Programs & Software
	case inputSniffer("((^(\\w*)|(what|what is))|show) ((my|the)? version|(\\w*))\\s?(version|(of (\\w*)))", input):
		switch input {
		case inputSniffer("^(whats|what is).*", input):
			r, _ := regexp.Compile("\\b(\\w+)$")
			execCommand(r.FindString(input) + " --version")
		case inputSniffer("^\\w*\\s(\\w*)$", input):
			r, _ := regexp.Compile("^\\w*")
			execCommand(r.FindString(input) + " --version")
		case inputSniffer("^show\\s\\w*\\s\\w*", input):
			input = inputSniffer("^\\w*\\s\\w*", input)
			r, _ := regexp.Compile("(\\w*)$")
			execCommand(r.FindString(input) + " --version")
		default:
			execCatch(input)
		}
	case inputSniffer("(start|open|launch) (a )?(local )?(web |python |testing )?(server)( (on|at|(on|at) port) \\d{4})?", input):
		pyVersion, _ := regexp.Compile("Python 3.\\d+.\\d*")
		port, _ := regexp.Compile("\\d{4}$")
		switch input {
		case inputSniffer("(start|open|launch) (web|python|testing)?\\s?server$", input):
			if pyVersion.MatchString(verifyCommand("python3 --version")) {
				execCommand("python -m SimpleHTTPServer")
			}
			println("You don't have Python 3 installed")
		case inputSniffer("(start|open|launch) (web|python|testing)?\\s?server (at|(on|at) port) \\d{4}", input):
			if pyVersion.MatchString(verifyCommand("python3 --version")) {
				execCommand("python -m SimpleHTTPServer " + port.FindString(input))
			}
		default:
			fmt.Println("nls: error: could not access python 3")
			os.Exit(1)
		}

	// User
	case inputSniffer("(whats|what is) my username", input):
		execCommand("whoami")
	case inputSniffer("(whats|what is) my (account |full )?name", input):
		execCommand("finger `whoami` | sed 's/.*: *//;q'")
	case inputSniffer("((whats|what is)|show) (my)?\\s?ip( address)?", input):
		darwin, _ := regexp.Compile("Darwin")
		linux, _ := regexp.Compile("Linux")
		switch {
		case darwin.MatchString(verifyCommand("uname -a")):
			execCommand("ipconfig getifaddr en0")
		case linux.MatchString(verifyCommand("uname -a")):
			execCommand("hostname -I")
		default:
			fmt.Println("nls: error: could not verify operating system")
			os.Exit(1)
		}

	default:
		execCatch(input)
	}
}

func main() {

	var version bool
	var help bool

	flag.BoolVar(&version, "version", false, "Prints current version")
	flag.BoolVar(&version, "v", false, "Prints current version (concise)")
	flag.BoolVar(&help, "help", false, "Prints help documentation")
	flag.BoolVar(&help, "h", false, "Prints help documentation (concise)")

	flag.Parse()

	input := strings.Join(flag.Args(), " ")

	switch {
	case help:
		helpDoc()
	case version:
		versionDoc()
	default:
		evaluate(input)
	}
}
