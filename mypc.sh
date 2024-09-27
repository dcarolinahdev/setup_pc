#!/bin/bash


echo "------------------------------------------"
echo "------------------------------------------"
echo "---> Starting"
echo "------------------------------------------"
echo "---> Updating PC"
sudo apt update -y
echo "---> Upgrading PC"
sudo apt upgrade -y

mkdir Installers
mkdir Projects

echo "------------------------------------------"
echo "------------------------------------------"
echo "---> Installing basics"
echo "------------------------------------------"
echo "---> Installing curl and tree"
sudo apt install curl tree
echo "---> Installing gimp, imagemagic and fonts-font-awesome"
sudo apt install gimp imagemagick fonts-font-awesome
echo "---> Installing sqlite3 and sqlitebrowser"
sudo apt install sqlite3 sqlitebrowser

echo "------------------------------------------"
echo "------------------------------------------"
echo "---> Git"
echo "------------------------------------------"
echo "1. Installing ..."
sudo apt install git

echo "2. Configuring ..."
echo "   user.name"
git config --global user.name ""

echo "   user.email"
git config --global user.email ""

echo "   pull.ff"
git config --global pull.ff only

echo "------------------------------------------"
echo "------------------------------------------"
echo "---> Python"
echo "------------------------------------------"
echo "1.  Installing version 12"
sudo apt install python3.12 python3.12-dbg python3.12-dev python3.12-doc python3.12-venv

echo "------------------------------------------"
echo "------------------------------------------"
echo "---> Postgresql"
echo "------------------------------------------"
echo "1.  Installing version 16"
sudo apt install postgresql-16 postgresql-client-16 postgresql-contrib libpq-dev postgresql-server-dev-16

echo "------------------------------------------"
echo "------------------------------------------"
echo "---> PgAdmin"
echo "------------------------------------------"
echo "1. Installing the public key for the repository (if not done previously):"
curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg

echo "2. Creating the repository configuration file:"
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'

echo "3. Installing for both desktop and web modes:"
sudo apt install pgadmin4

echo "4. Configuring Postgres Authentication"
sudo systemctl is-active postgresql
sudo systemctl is-enabled postgresql
sudo systemctl status postgresql
sudo pg_isready
echo "Optional update scram-sha-256 to md5 in pg_hba.conf"
# sudo nano --user-data-dir=~/root /etc/postgresql/16/main/pg_hba.conf

echo "
sudo su - postgres
psql
ALTER USER postgres PASSWORD 'myPassword'; OR
create user your_user with superuser password 'admin';
\q
"

echo "5. Configuring the webserver, if you installed pgadmin4-web:"
echo "/usr/pgadmin4/bin/setup-web.sh"

echo "------------------------------------------"
echo "------------------------------------------"
echo "---> Google Chrome"
echo "------------------------------------------"
cd Installers
echo "1. Downloading ..."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

echo "2. Installing ..."
sudo dpkg -i google-chrome-stable_current_amd64.deb
cd ..

echo "------------------------------------------"
echo "------------------------------------------"
echo "---> Oh my ZSH"
echo "------------------------------------------"
echo "1. Installing ZSH..."
sudo apt install zsh -y

echo "2. First setup for ZSH"
echo "To start using Zsh, open a terminal and execute:"
echo "Select option (2)"
zsh --version
zsh

echo "3. Making ZSH my default shell ..."
chsh -s $(which zsh)
echo "To verify your current shell, run:"
echo $SHELL

echo "4.1 Installing OH MY ZSH"
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

echo "4.2 Customizing OH MY ZSH"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

nano ~/.zshrc
echo "replace: ZSH_THEME='jonathan'"
echo "replace: plugins=(git zsh-autosuggestions zsh-syntax-highlighting)"

echo "reloading zsh:"
source ~/.zshrc

echo "------------------------------------------"
echo "------------------------------------------"
echo "---> Permanent aliases"
echo "------------------------------------------"
echo "...  write these lines in ~/.bashrc OR ~/.zshrc"
echo "venv-py3     ... Creating a virtualenv"
alias venv-py3="python3 -m venv .venv"

echo "venv-active  ... Activating a virtualenv"
alias venv-active="source .venv/bin/activate"

echo "glog_short   ... Git Log (short version)"
alias glog_short="git log --all --graph --oneline"

echo "gitlog_tree  ... Git Log (tree)"
alias gitlog_tree="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold
blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)-
%an%C(reset)%C(bold yellow)%d%C(reset)' --all"

echo "upg          ... apt update and upgrade"
alias upg="sudo apt update && sudo apt upgrade"

source ~/.zshrc

echo "------------------------------------------"
echo "------------------------------------------"
echo "1. Downloading Visual Studio Code ..."
echo "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
echo "sudo apt install ./code_1.93.1-1726079302_amd64.deb"

echo "... Extensions for python:

Python by Microsoft
Python Indent by Kbrose
Python Docstring Generator by Nils Werner
AREPL for Python
# gitlens
"

echo "2. Installing Okular"
sudo apt install okular

echo "3. Installing Anydesk"
echo "Go to: https://anydesk.com/es/downloads/linuxecho "To verify your current shell, run: echo $SHELL""
echo "anydesk_6.3.3-1_amd64.deb"

echo "4. Configure SSH KEY"
echo "---> Verifying SSH KEYs"
ls -al ~/.ssh

echo "---> Generating SSH KEYs"
echo "ssh-keygen -t ed25519 -C 'your_email@example.com'"

echo "---> Adding the SSH KEY to the SSH-agent"
echo "1. Start the ssh-agent in the background."
echo "eval $(ssh-agent -s)"

echo "2. Add your SSH private key to the ssh-agent."
echo "ssh-add ~/.ssh/id_ed25519"

echo "3. Copy the SSH KEY: cat ~/.ssh/id_rsa.pub"

echo "4. Add the SSH public key to your account on GitHub"

exit
