#============================
# @author: Shashank Singh
#
# Aliases for the Fish shell
#============================

alias v=lvim
alias sv='sudo ~/.local/bin/lvim'
alias config='/usr/bin/git --git-dir=$HOME/Workspace/Repos/DotFiles --work-tree=$HOME'
alias edge=microsoft-edge-stable
alias add-ssh='~/Workspace/Repos/Projects/Scripts/add_ssh.py'
alias inscrybe='~/Workspace/Repos/Projects/Scripts/inscrybe.sh'
alias st='speedtest --progress=yes'
alias run='~/Workspace/Repos/Projects/Scripts/run.sh'

# Aliases for navigating backwards
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Replace 'ls' with 'exa'
alias ls='eza --icons'
alias ll='eza -l --git --icons'
alias la='eza -la --git --icons'
alias lt='eza -la --git --icons --tree'

# Rate mirrors using save them to /etc/pacman.d/mirrorlist
alias update-mirrors='rate-mirrors --allow-root --protocol https arch | sudo tee /etc/pacman.d/mirrorlist'
