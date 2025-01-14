#===================================
# @author: Shashank Singh
# Theme: Tokyonight
#
# Configurations for the Fish shell
#===================================

# ========================
# Set Default Theme
# ========================

fish_config theme choose "Tokyonight"

# ========================
# Load utility functions
# ========================

source ~/.config/fish/functions/utility_functions.fish

# ========================
# Initialize SSH Agent
# ========================

init_ssh_agent

# ========================
# Initialize Starship
# ========================

starship init fish | source

# ========================
# Environment Variables
# ========================

set -x -g EDITOR $HOME/.local/bin/lvim           # Default editor
set -x -g CHROME_EXECUTABLE /opt/brave-bin/brave # For Flutter to detect the browser
set -x -g JAVA_HOME /usr/lib/jvm/java-21-openjdk # OpenJDK 21 LTS
set -x -g GRADLE_HOME /usr/share/java/gradle     # Gradle (Latest)
