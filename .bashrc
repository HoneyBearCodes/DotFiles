#=============================
# @author: Shashank Singh
# Theme: Tokyonight
#=============================

# ========================
# General Configuration
# ========================

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Standard prompt
PS1='[\u@\h \W]\$ '
# ========================
# Aliases
# ========================

# Tools & scripts
alias grep='grep --color=auto'
alias v=lvim
alias sv='sudo lvim'
alias config='/usr/bin/git --git-dir=$HOME/Workspace/Repos/DotFiles --work-tree=$HOME'
alias edge=microsoft-edge-stable
alias add-ssh='~/Workspace/Repos/Projects/Scripts/add_ssh.py'
alias inscrybe='~/Workspace/Repos/Projects/Scripts/inscrybe.sh'
alias st='speedtest --progress=yes'
alias run='~/Workspace/Repos/Projects/Scripts/run.sh'
alias update-mirrors='rate-mirrors --allow-root --protocol https arch | sudo tee /etc/pacman.d/mirrorlist'
alias anaconda='source ~/.conda.bashrc'

# Navigating backwards
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Replace `ls` with `eza`
alias ls='eza --icons'
alias ll='eza -l --git --icons'
alias la='eza -la --git --icons'
alias lt='eza -la --git --icons --tree'


# ========================
# Initializing Programs
# ========================

# Load NVM and its Bash completions
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  

# Initialize starship prompt for bash
eval "$(starship init bash)"

export PATH=$PATH:/home/honey/.spicetify

# ========================
# Environment Variables
# ========================

# Java (JDK 21 LTS)
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
export PATH=$JAVA_HOME/bin:$PATH

# Gradle 
export GRADLE_HOME=/usr/share/java/gradle
export PATH=$GRADLE_HOME/bin:$PATH

# Default editor
export EDITOR=$HOME/.local/bin/lvim
