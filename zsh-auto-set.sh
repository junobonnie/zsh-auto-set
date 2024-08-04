#!/bin/bash

# Define colors using ANSI escape codes
red='\033[31m'
green='\033[32m'
orange='\033[33m'
blue='\033[34m'
purple='\033[35m'
white='\033[0m'

wait_() {
    local input
    local i
    if [ "$1" == "" ]; then
        echo "Press Enter to skip."
        echo ""
        i=1
        while true; do
            cecho purple "$i sec..."
            if read -t 1 -r input; then
                if [ "$input" = "" ]; then
                    break
                fi
            fi
            echo -ne "\033[1A\033[K"
            ((i++))
        done
    else
        cecho orange "Automatically starts after $1 seconds."
        echo "Press Enter to skip."
        echo ""
        for ((i = 1; i <= $1; i++)); do
            cecho purple "$i sec..."
            if read -t 1 -r input; then
                if [ "$input" = "" ]; then
                    break
                fi
            fi
            echo -ne "\033[1A\033[K"
        done
    fi
}

cecho() {
    local color_code="$1"
    local message="$2"
    if [ "$color_code" = "-n" ]; then
        color_code="$2"
        message="$3"
        echo -ne "${!color_code}${message}${white}" # No newline
    else
        echo -e "${!color_code}${message}${white}" # With newline
    fi
}

yes_no() {
    while true; do
        echo -n "Proceed ("; cecho -n green "y"; echo -n "/"; cecho -n red "n"; echo -n ")? "
        read ans
        if [ "$ans" = "y" ]; then
            eval $1
            wait_
            break
        elif [ "$ans" = "n" ]; then
            break
        fi
    done
}

install_zsh() {
    sudo apt install -y zsh
    chsh -s $(which zsh)
    echo ""
    cecho green "[Reboot]"
    echo ""
    echo "You need to reboot."
    echo "We will do"
    echo ""
    cecho blue "  \$ sudo reboot"
    echo ""
    yes_no "sudo reboot"
}

install_apt_package() {
    if dpkg -l | grep -q "^ii  $1 "; then
        cecho green "[$1 is already installed]"
    else
        echo ""
        cecho green "[Install $1]"
        echo ""
        echo "You need to install $1 first."
        echo "We will do"
        echo ""
        cecho blue "  \$ sudo apt install $1"
        echo ""
        yes_no "sudo apt install -y $1"
    fi
}

# Display introductory message
echo "                                                                  "
echo "          Z S H - A U T O - S E T                                 "
echo "          Version 1.0    last modified 2024-08-03                 "
echo "                                                                  "
echo "          Copyright (C) 2024~                                     "
echo "          Developed by Replica                                    "
echo "                                                                  "
echo "          My Github Page:     http://github.com/junobonnie        "

echo ""
wait_ 10

# Clear the screen and begin the installation process
clear
cecho green "[Install zsh]"
echo ""
if [[ "$SHELL" =~ zsh ]]; then
    echo "You already have zsh."
else
    echo "You need to install zsh."
    echo "We will do"
    echo ""
    cecho blue "  \$ sudo apt install zsh"
    cecho blue "  \$ chsh -s \$(which zsh)"
    echo ""
    yes_no "install_zsh"
fi
echo ""

# Clear the screen and check/install necessary packages
clear
install_apt_package git

clear
install_apt_package curl

clear
install_apt_package wget

# Prompt and install oh-my-zsh
clear
cecho green "[Install oh-my-zsh]"
echo ""
echo "Do you want to install oh-my-zsh?"
echo "We will do"
echo ""
cecho blue "  \$ curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh"
echo ""
yes_no "curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh"

# Prompt and install powerlevel10k theme
clear
cecho green "[Install powerlevel10k]"
echo ""
echo "Do you want to install powerlevel10k?"
echo "We will do"
echo ""
cecho blue "  \$ git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \${ZSH_CUSTOM:-\$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
echo ""
cecho blue "  \$ sed -i 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"powerlevel10k\/powerlevel10k\"/gi' ~/.zshrc"
echo ""
yes_no "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \${ZSH_CUSTOM:-\$HOME/.oh-my-zsh/custom}/themes/powerlevel10k && sed -i 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"powerlevel10k\/powerlevel10k\"/gi' ~/.zshrc"

# Prompt and install autojump
clear
cecho green "[Install autojump]"
echo ""
echo "Do you want to install the autojump plugin?"
echo "We will do"
echo ""
cecho blue "  \$ sudo apt install autojump"
echo ""
cecho red "If you install this."
cecho red "You need to add autojump to .zshrc like that."
echo ""
cecho orange "  plugins=(git autojump)"
echo ""
yes_no "sudo apt install autojump"

# Prompt and install zsh-autosuggestions
clear
cecho green "[Install zsh-autosuggestions]"
echo ""
echo "Do you want to install the zsh-autosuggestions plugin?"
echo "We will do"
echo ""
cecho blue "  \$ git clone https://github.com/zsh-users/zsh-autosuggestions \${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
echo ""
cecho red "If you install this."
cecho red "You need to add zsh-autosuggestions to .zshrc like that."
echo ""
cecho orange "  plugins=(git zsh-autosuggestions)"
echo ""
yes_no "git clone https://github.com/zsh-users/zsh-autosuggestions \${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

# Prompt and install zsh-syntax-highlighting
clear
cecho green "[Install zsh-syntax-highlighting]"
echo ""
echo "Do you want to install the zsh-syntax-highlighting plugin?"
echo "We will do"
echo ""
cecho blue "  \$ git clone https://github.com/zsh-users/zsh-syntax-highlighting \${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
echo ""
cecho red "If you install this."
cecho red "You need to add zsh-syntax-highlighting to .zshrc like that."
echo ""
cecho orange "  plugins=(git zsh-syntax-highlighting)"
echo ""
yes_no "git clone https://github.com/zsh-users/zsh-syntax-highlighting \${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
