#!/bin/bash

echo "Starting"
sudo apt update
sudo apt upgrade

echo "------------------------------------------"
echo "------------------------------------------"
echo "--> Installing basics"
sudo apt install curl tree
sudo apt install gimp imagemagick fonts-font-awesome
sudo apt install sqlite3 sqlitebrowser

echo "------------------------------------------"
echo "------------------------------------------"
echo "---> Git"
echo "1. Installing ..."
sudo apt install git

echo "2. Configuring ..."
echo "   user.name"
git config --global user.name ""

echo "   user.email"
git config --global user.email ""
# git config --global merge.ff true
# git config --global pull.ff only

echo "------------------------------------------"
echo "------------------------------------------"
echo "---> Python"
echo "1.  Installing version 12"
sudo apt install python3.12 python3.12-dbg python3.12-dev python3.12-doc python3.12-venv

echo "------------------------------------------"
echo "------------------------------------------"
echo "---> Postgresql"
echo "1.  Installing version 16"
sudo apt install postgresql-16 postgresql-client-16 postgresql-contrib libpq-dev postgresql-server-dev-16

echo "------------------------------------------"
echo "------------------------------------------"
echo "---> PgAdmin"
echo "1. Installing the public key for the repository (if not done previously):"
curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg

echo "2. Creating the repository configuration file:"
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'

echo "3. Installing for both desktop and web modes:"
sudo apt install pgadmin4

echo "4. Configuring the webserver, if you installed pgadmin4-web:"
echo "/usr/pgadmin4/bin/setup-web.sh"

echo "------------------------------------------"
echo "------------------------------------------"
echo "---> Google Chrome"
mkdir Installers
cd Installers
echo "1. Downloading ..."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

echo "2. Installing ..."
sudo dpkg -i google-chrome-stable_current_amd64.deb
cd ..

echo "------------------------------------------"
echo "------------------------------------------"
echo "---> Aliases"
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

echo "------------------------------------------"
echo "------------------------------------------"
echo "---> Oh my ZSH"
echo "1. Installing ..."
sudo apt install zsh -y
zsh --version
echo "To start using Zsh, open a terminal and execute: zsh"
echo "To verify your current shell, run: echo $SHELL"

echo "2. Plugins"
echo "find: nano ~/.zshrc"
echo "replace: plugins=(git zsh-autosuggestions zsh-syntax-highlighting)"
echo "reload zsh: source ~/.zshrc"

echo "3. Making Zsh my default shell ..."
echo "try: chsh -s $('which' zsh)"


echo "------------------------------------------"
echo "------------------------------------------"
echo "---> Download projects to Documents"
mkdir Projects
cd Projects
echo "clone as: git clone git@github.com:dcarolinahdev/example.git"
cd ..

echo "------------------------------------------"
echo "------------------------------------------"
echo "1. Downloading Visual Studio Code ..."
echo "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
echo "sudo apt install ./code_1.93.1-1726079302_amd64.deb"

echo "2. Installing Okular"
sudo apt install okular

echo "3. Installing Anydesk"
echo "Go to: https://anydesk.com/es/downloads/linux"
echo "anydesk_6.3.3-1_amd64.deb"

echo "4. Configure SSH KEY"
echo "---> Verifying SSH KEYs"
echo "Enter ls -al ~/.ssh to see if existing SSH keys are present."

echo "---> Generating SSH KEYs"
echo "ssh-keygen -t ed25519 -C 'your_email@example.com'"
echo "OR"
echo "ssh-keygen -t rsa -b 4096 -C "your_email@example.com""

echo "---> Adding the SSH KEY to the SSH-agent"
echo "1. Start the ssh-agent in the background."
echo "eval $(ssh-agent -s)"

echo "2. Add your SSH private key to the ssh-agent."
echo "ssh-add ~/.ssh/id_ed25519"

echo "3. Add the SSH public key to your account on GitHub"

exit
