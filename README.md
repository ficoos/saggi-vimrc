# Saggi's Wonderful VIMRC

## Installation instructions

1. Download the vimrc file and put it (or parts of it) under `~/.vimrc`

   ```sh
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
```

2. Start vim
3. Run `:BundleInstall` to install all the plugins
4. Compile *YouCompleteMe*

   ```sh
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
```

5. Restart vim
6. Profit
