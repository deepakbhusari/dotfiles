#!/bin/bash

# install nix
curl -L https://nixos.org/nix/install | sh 

#source the nix file in bashrc or zshrc file
. ~/.nix-profile/etc/profile.d/nix.sh

# install packages
nix-env -iA \ 
nixpkgs.zsh \ 
nixpkgs.tmux \ 
nixpkgs.stow \ 
nixpkgs.git \  
nixpkgs.nvim \ 
nixpkgs.direnv \ 
nixpkgs.fzf \ 
nixpkgs.yarn \ 
nixpkgs.oh-my-zsh \
nixpkgs.antigen \
nixpkgs.ripgrep 


#dot files are in folder ~/.dotfiles
# stow configuration files
stow -v zsh
stow -v antigen
stow -v git
stow -v nvim
stow -v tmux

# add zsh shell to / etc/shell command -v zsh | sudo tee -a /etc/shells
sudo sh -c "echo $(which zsh) >> /etc/shells"

# use zsh as a default shell
sudo chsh -s $(which zsh) $USER

#antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

