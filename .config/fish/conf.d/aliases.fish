############################################
#                 FUNCTIONS                #
############################################


# Functions needed for !! and !$

function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

# The bindings for !! and !$
if [ $fish_key_bindings = "fish_vi_key_bindings" ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

# Function for creating a backup file
# ex: backup file.txt
# result: copies file as file.txt.bak
function backup --argument filename
    cp $filename $filename.bak
end

# Function for copying files and directories, even recursively.
# ex: copy DIRNAME LOCATIONS
# result: copies the directory and all of its contents.
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
	set from (echo $argv[1] | trim-right /)
	set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end




############################################
#                  ALIASES                 # 
############################################


alias v=lvim
alias sv='sudo lvim'
#alias e="emacsclient -c -a 'emacs'"
alias config='/usr/bin/git --git-dir=$HOME/Documents/Repos/DotFiles --work-tree=$HOME'
alias edge=microsoft-edge-stable
alias add-ssh='~/Documents/Repos/Projects/Scripts/add_ssh.py'
alias st='speedtest --progress=yes'
# alias bt-start='sudo systemctl start bluetooth.service'
# alias bt-stop='sudo systemctl stop bluetooth.service'
# alias bt-restart='sudo systemctl restart bluetooth.service'

# alias for navigating backwards
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# replace 'ls' with 'exa'
alias ls='exa --icons'
alias ll='exa -l --git --icons'
alias la='exa -la --git --icons'
alias lt='exa -la --git --icons --tree'

# aliast to rate mirrors using rate-mirrors and save them to /etc/pacman.d/mirrorlist
alias update-mirrors='rate-mirrors --allow-root --protocol https arch | sudo tee /etc/pacman.d/mirrorlist'

# custom Functions

# for compiling & running c++ file
function run
  g++ $argv -o build.out
  ./build.out
end

# for managing bluetooth
function bt
  sudo systemctl $argv bluetooth.service
end

# for displaying added paths
function fish_display_paths
  echo $fish_user_paths | tr " " "\n" | nl
end

# for removing added paths
function fish_remove_path
  set --erase --universal fish_user_paths[$argv]
end

# for initializing a flutter project with gradle-8.5
function create_flutter_project
    if test (count $argv) -ne 1
        echo "Usage: create_flutter_project <project_name>"
        return 1
    end
    set project_name $argv[1]
    flutter create $project_name
    cd $project_name/android/
    sed -i 's#distributionUrl=.*#distributionUrl=file:///opt/gradle-8.5/wrappers/dists/gradle-8.5-all.zip#' gradle/wrapper/gradle-wrapper.properties
    ./gradlew wrapper
end

