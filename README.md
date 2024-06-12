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
  bash ~/.dotfiles/ansible.sh <target> [--tags <optional tags>]
  ```
### Available targets:
  1. **zsh.yml** - Installs zsh, oh-my-zsh, and some plugins
  2. **toolchains.yml** - Installs C++, Python, Node (and Bun), and Rust toolchains
     - To select a specific toolchain add any of the following tags:
         * cpp
         * python
         * node
         * rust
     - For example, to install only the C++ (clang-18, g++-13, cmake, etc) and Rust (Cargo) toolchains, run the following:
     ```sh
     ~/.dotfiles/ansible.sh toolchains.yml --tags cpp,rust
     ```
     - Or, do not include any tags to install all toolchains
  3. **neovim.yml** - Installs the latest stable version of neovim (builds from source)

<!-- TODO -->
## TODO

- [ ] nvim
- [ ] tmux
- [ ] knomad
- [ ] a whole lot more
