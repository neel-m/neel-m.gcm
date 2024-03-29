#!/usr/bin/env bash

GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[1;33m"
CR="\e[0m"

# ---------------------------------------------
# ~/.local/bin
# ---------------------------------------------
if [[ ":${PATH}:" != *":${HOME}/.local/bin:"* ]]; then
    echo "adding ${HOME}/.local/bin to PATH in ~/.bashrc"
else
    echo "✓ ${HOME}/.local/bin already in path"
fi
# ---------------------------------------------
# Install stuff
# ---------------------------------------------
echo -e "\n\n------------------------------------------------------------------------"
echo "Installing git, python3-pip, and ansible (may require sudo password)"
echo "------------------------------------------------------------------------"

export PATH=~/.local/bin:$PATH
sudo apt update
sudo apt install -y git python3-pip
pip install -U --user ansible
pip install -U --user jmespath
# ---------------------------------------------
# Clone neel-m.gcm Repo
# ---------------------------------------------
echo -e "\n\n------------------------------------------------------------------------"
echo "Clone (or check existing) bardev repo -> ~/.neel-m.gcm"
echo "------------------------------------------------------------------------"
gcm_dest=.neel-m.gcm
if [ -d "${HOME}/$gcm_dest" ]; then
    pushd "${HOME}/$gcm_dest" > /dev/null
    git status > /dev/null
    rc=$?
    if [ "$rc" == 0 ]; then
        echo -e "${GREEN}✓${CR} ${gcm_dest} exists and is a git repo. Syncing."
        git pull
        popd > /dev/null
    else
        popd > /dev/null
        echo -e "${RED} ${HOME}/${gcm_dest} exists but is not a git repo? Fix please."
        exit 1
    fi
else
    cd ~
    git clone https://github.com/neel-m/neel-m.gcm.git $gcm_dest
    rc=$?
    if [ "$rc" != 0 ]; then
        echo -e "${RED}ERROR: could not clone the gcm repo${CR}"
        exit 1
    fi
fi

# ---------------------------------------------
# Run Playbook
# ---------------------------------------------
echo -e "\n\n------------------------------------------------------------------------"
echo "Ready to run ansible and complete the configuration of your env."
echo "This will take a few minutes."
echo -e "\n\n${GREEN}Ansible will ask you for your sudo password${CR}"
echo -e "${GREEN}with the prompt ${YELLOW}'BECOME password:'${CR}"
echo "------------------------------------------------------------------------"
echo -e "${YELLOW}Press ENTER to continue..."
read -p ""

pushd "$HOME/$gcm_dest/ansible" > /dev/null
ansible-playbook gcm_book.yaml
rc=$?
popd > /dev/null

if [ "$rc" == "0" ]; then
    echo -e "${GREEN}Your environment is now ready.${CR}"
else
    echo -e "${RED}Something didn't work with ansible.${CR}"
fi
