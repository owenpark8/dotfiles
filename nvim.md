# neovim

## building from source

### deps

```bash
sudo apt install \
        ninja-build \
        gettext \
        cmake \
        unzip \
        curl \
        build-essential
```

### build

```bash
git clone https://github.com/neovim/neovim
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
```

### install

```bash
cd build
cpack -G DEB
sudo dpkg -i nvim-linux64.deb
```

## config

### deps

```bash
sudo apt install ripgrep fd-find xclip
```

### install

```bash
mkdir -p ~/.config
cd ~/.config
ln -s $DOTFILES_DIR/.config/nvim .
```
