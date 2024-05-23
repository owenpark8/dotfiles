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
3. Install fzf 
  Follow the "Using git" instructions in the [repo](https://github.com/junegunn/fzf?tab=readme-ov-file#using-git)

4. Install [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh) and [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh)
  ```sh
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  ```
  ```sh
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  ```

<!-- TODO -->
## TODO

- [ ] nvim
- [ ] i3
- [ ] tmux
- [ ] knomad
- [ ] a whole lot more
