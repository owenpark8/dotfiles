<!-- PROJECT LOGO -->
<div align="center">
  <h3 align="center">config</h3>

  <p align="center">
    Personal documentation so I can remember how to set up my system. Maybe I should automate this... nah.
  </p>
  <p aligh="center">
      (last tested on 5/22/24 Ubuntu 22.04.02)
  </p>
  
</div>


<!-- GETTING STARTED -->
## Starting from fresh Ubuntu install

### The Basics

1. Yea. Self explanatory.

  ```sh
  sudo apt update
  ```
  ```sh
  sudo apt upgrade
  ```
2. Packages !

  ```sh
  sudo apt install git zsh neovim tmux clangd clang-tidy clang-format cmake ccache python3-pip 
  ```

### Git

1. [ssh key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key)
2. Done. Now clone this repo, buddy.
```sh
git clone git@github.com:owenpark8/config.git ~/config-repo
```

### zsh

1. Install Oh My Zsh
   ```sh
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```
2. Use .zshrc from this repo
   ```sh
   cp ~/config-repo/.zshrc ~/.zshrc
   ```
3. Installing fzf 

<!-- TODO -->
## TODO

- [ ] nvim
- [ ] i3
- [ ] tmux
- [ ] a whole lot more
