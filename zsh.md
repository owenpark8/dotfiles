# zsh

## install

```bash
sudo apt install zsh
```

## set as default shell

```bash
chsh -s $(which zsh)
```

## config (oh-my-zsh)

### install

```bash
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
```

### zshrc

```bash
cd && ln -s $DOTFILES_DIR/.zshrc .
```

### plugins

zsh-autosuggestions

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
```

zsh-syntax-highlighting

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
```

fzf

```bash
git clone https://github.com/junegunn/fzf ~/.fzf
~/.fzf/install --key-bindings --completion --no-update-rc --no-bash --no-fish
```

zoxide

```bash
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
```
