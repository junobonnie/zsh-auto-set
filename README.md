# zsh-auto-set
wget https://raw.githubusercontent.com/junobonnie/zsh-auto-set/main/zsh-auto-set.sh
chmod 777 zsh-auto-set.sh
./zsh-auto-set.sh

wget https://raw.githubusercontent.com/junobonnie/zsh-auto-set/main/.zsh_script

# alacritty 설치
sudo apt install alacritty
mkdir ~/.config/alacritty
mv alacritty.toml ~/.config/alacritty

# github-desktop 설치

wget -qO - https://apt.packages.shiftkey.dev/gpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/shiftkey-packages.gpg > /dev/null

sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/shiftkey-packages.gpg] https://apt.packages.shiftkey.dev/ubuntu/ any main" > /etc/apt/sources.list.d/shiftkey-packages.list'

sudo apt update && sudo apt install github-deskto

# rust 설치
curl https://sh.rustup.rs -sSf | sh -s
cargo install lsd bottom viu mcfly

sudo apt install neofetch fzf duf

sudo apt install npm
sudo npm install -g tldr

thorium-broswer
steam
vscode
bottle
- kakaotalk
  - cjkfont
spyder
discode

wget https://raw.githubusercontent.com/junobonnie/zsh-auto-set/main/add_to_zshrc
