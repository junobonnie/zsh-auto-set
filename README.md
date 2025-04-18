# zsh-auto-set
```
wget https://raw.githubusercontent.com/junobonnie/zsh-auto-set/main/zsh-auto-set.sh
chmod 777 zsh-auto-set.sh
./zsh-auto-set.sh
```
# Other utils
### .zsh_script
```
wget https://raw.githubusercontent.com/junobonnie/zsh-auto-set/main/.zsh_script
```
### .zsh_aliases
```
wget https://raw.githubusercontent.com/junobonnie/zsh-auto-set/main/.zsh_aliases
```
### Install alacritty
```
sudo apt install alacritty
wget https://raw.githubusercontent.com/junobonnie/zsh-auto-set/main/alacritty.toml
mkdir ~/.config/alacritty
mv alacritty.toml ~/.config/alacritty
```
### Install github-desktop
```
wget -qO - https://apt.packages.shiftkey.dev/gpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/shiftkey-packages.gpg > /dev/null
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/shiftkey-packages.gpg] https://apt.packages.shiftkey.dev/ubuntu/ any main" > /etc/apt/sources.list.d/shiftkey-packages.list'
sudo apt update && sudo apt install github-deskto
```
### Install D2Coding Nerd
https://github.com/junobonnie/D2coding-Nerd-fonts/archive/refs/heads/main.zip
### Install rust & modern CLI
```
curl https://sh.rustup.rs -sSf | sh -s
cargo install lsd bottom viu mcfly
```
### Other packages
```
sudo apt install neofetch fzf duf ncdu
```
#### for arm64
```
git clone https://github.com/muesli/duf.git
cd duf
go build
mv duf .duf
cd .cargo/bin
ln -s ~/.duf/duf .
```
### Install tldr
```
sudo apt install npm
sudo npm install -g tldr
```
#### for arm64
```
sudo snap install tldr
```

Add this in .zshrc
```
export TLDR_COLOR_NAME="cyan bold"
export TLDR_COLOR_DESCRIPTION="white"
export TLDR_COLOR_EXAMPLE="green"
export TLDR_COLOR_COMMAND="blue bold"
export TLDR_COLOR_PARAMETER="grey bold"
```
and modified .zsh_aliases
```
alias q=tldr
```
![image](https://github.com/user-attachments/assets/613a86fd-bf46-4a3f-9eec-7e91193acff8)

### Install miniconda
https://docs.anaconda.com/miniconda/#miniconda-latest-installer-links
### .zshrc add-on
```
wget https://raw.githubusercontent.com/junobonnie/zsh-auto-set/main/add_to_zshrc
```
### Others
thorium-broswer

steam

vscode

bottle

- kakaotalk

  - cjkfont

spyder

discode
