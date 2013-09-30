# Saggi's Wonderful VIMRC

## Features

* Fast graphical boot
  
  Disables the toolbar menu properly so that it's not only hidden but never
  loaded. This prevents vim from wasting time searching for and loading icons
  which speeds up start time of gvim.

* Uses vundle for bundle management
* Configures syntastic
* Configures airline to enable work with unpatched fonts
* Go support
* Git support
* Python\go\c\cpp code completion
* CTRL-P for opening files in the project quickly
* CTRL-SHIFT-C and SHIFT-INS work in gvim like they would in a terminal
* Better completion
* More...

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
`

## TODO
- Figure out if you can tie ctrl-p to figure out we are using netrw so it
  works over SSH.
- Get YouCompleteMe compilation automatic somehow
- Get sparkup to work!
- Integrate GDB
- Figure out how to configure `make` action per project (.vimdir maybe?)
