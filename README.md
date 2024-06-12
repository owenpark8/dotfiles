<!-- PROJECT LOGO -->
<div align="center">
  <h3 align="center">dotfiles</h3>

  <p align="center">
        My dotfiles and Ansible playbooks to set up my system.
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
  bash ~/.dotfiles/ansible.sh <target> <additional ansible-playbook args>
  ```
Anything following the target will be added as regular ```ansible-playbook``` arguments
For example, if you want to add tags:
  ```sh
  bash ~/.dotfiles/ansible.sh <target> --tags tag1,tag2
  ```

### Available targets:
  1. **```zsh.yml```** - Installs zsh, oh-my-zsh, and some plugins
  2. **```toolchains.yml```** - Installs popular code toolchains
     - To select a specific toolchain add as many of the following tags:
       * ```cpp``` - CMake, Ninja, etc. Makes LLVM-18 and GCC-13 toolchains the default 
       * ```python``` - python3.10, pip, virtualenvwrapper, etc
       * ```node``` - nvm, latest Node, and Bun
       * ```rust``` - Rust and Cargo 
     - Or, do not include any tags to install all toolchains
  3. **```neovim.yml```** - Builds and installs Neovim (stable) and sets up lazy.nvim plugins
     - To only build and install Neovim, add the ```install``` tag
     - To only set up lazy.nvim plugins, add the ```config``` tag

<!-- TODO -->
## TODO

- [ ] tmux
- [ ] knomad
- [ ] a whole lot more
