#!/bin/bash
red="\033[31m"
green="\033[32m"
orange="\033[33m"
blue="\033[34m"
purple="\033[35m"
white="\033[0m"

wait_()
{
    input="x"
    cecho orange "Automatically starts after $1 seconds."
    echo "Press enter for skip."
    echo ""
    for i in {1..$1}
    do
        cecho purple "$i sec..."
        read -t 1 input
        if [ "$input" = "" ]; then
            break
        fi
        echo -ne "\033[1A\033[K"
    done
}

cecho()
{
    if [ "$1" = -n ]; then
        eval echo -n \$$2 
        echo -n "$3$white"
    else
        eval echo -n \$$1 
        echo "$2$white"
    fi
}

yes_no()
{
    while true
    do 
        echo -n "Proceed ("; cecho -n green "y"; echo -n "/"; cecho -n  red "n"; echo -n ")? "
        read ans
        if [ "$ans" = "y" ]; then
            eval $1
            break
        elif [ "$ans" = "n" ]; then
            break
        fi
    done
}

install_zsh()
{
    sudo apt install zsh
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

install_apt_package()
{
    if which $1 &> /dev/null ; then
    else
        echo ""
        cecho green "[Install $1]"
        echo ""
        echo "You need to install $1 first."
        echo "We will do"
        echo ""
        cecho blue "  \$ sudo apt install $1"
        echo ""
        yes_no "sudo apt install $1"
    fi
}


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
wait_ 5

clear
install_apt_package git

clear
install_apt_package curl

clear
install_apt_package wget

clear
cecho green "[Install oh-my-zsh]"
echo ""
echo "Do you want to install oh-my-zsh?"
echo "We will do"
echo ""
cecho blue "  \$ curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh"
echo ""
yes_no "curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh"


clear
cecho green "[Install powerlevel10k]"
echo ""
echo "Do you want to install powerlevel10k?"
echo "We will do"
echo ""
cecho blue "  \$ git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \${ZSH_CUSTOM:-\$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
echo ""
cecho blue "  \$ sed -i 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"powerlevel10k/powerlevel10k\"/gi' .zshrc"
echo ""
yes_no "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \${ZSH_CUSTOM:-\$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"powerlevel10k/powerlevel10k\"/gi' .zshrc"

clear
cecho green "[Install autojump]"
echo ""
echo "Do you want to install autojump plugin?"
echo "We will do"
echo ""
cecho blue "  \$ sudo apt install autojump"
echo ""
cecho red "If you install this."
cecho red "You need to type a autojump in .zshrc like that."
echo ""
cecho orange "  plugins=(git autojump)"
echo ""
yes_no "sudo apt install autojump"

clear
cecho green "[Install zsh-autosuggestions]"
echo ""
echo "Do you want to install zsh-autosuggestions plugin?"
echo "We will do"
    echo ""
    cecho blue "  \$ git clone https://github.com/zsh-users/zsh-autosuggestions \${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
echo ""
cecho red "If you install this."
cecho red "You need to type a zsh-autosuggestions in .zshrc like that."
echo ""
cecho orange "  plugins=(git zsh-autosuggestions)"
echo ""
yes_no "git clone https://github.com/zsh-users/zsh-autosuggestions \${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestionsc"

clear
cecho green "[Install zsh-syntax-highlighting]"
echo ""
echo "Do you want to install zsh-syntax-highlighting plugin?"
echo "We will do"
echo ""
cecho blue "  \$ git clone https://github.com/zsh-users/zsh-syntax-highlighting \${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
echo ""
cecho red "If you install this."
cecho red "You need to type a zsh-syntax-highlighting in .zshrc like that."
echo ""
cecho orange "  plugins=(git zsh-syntax-highlighting)"
echo ""
yes_no "git clone https://github.com/zsh-users/zsh-syntax-highlighting \${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
