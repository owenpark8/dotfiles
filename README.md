<!-- PROJECT LOGO -->
<div align="center">
  <h3 align="center">dotfiles</h3>

  <p align="center">
    Personal documentation so I can remember how to set up my system.
  </p>
  <p aligh="center">
      (last tested on 6/8/24 Ubuntu 22.04.02)
  </p>
  
</div>


<!-- GETTING STARTED -->
## Running the Ansible Playbooks

1. Install Ansible
  ```sh
  sudo apt update
  sudo apt install software-properties-common
  sudo add-apt-repository --yes --update ppa:ansible/ansible
  sudo apt install ansible
  ```

2. Clone this repository
  ```sh
  git clone https://github.com/owenpark8/dotfiles.git ~/.dotfiles
  ```

3. Run a playbook
  ```sh
  bash ~/.dotfiles/ansible.sh <target>
  ```
### Available targets:
   1. zsh.yml - Installs zsh, oh-my-zsh, and some plugins
   2. toolchains.yml - Installs latest versions of gcc, g++, clangd, python3, nvm, etc

<!-- TODO -->
## TODO

- [ ] nvim
- [ ] tmux
- [ ] knomad
- [ ] a whole lot more
