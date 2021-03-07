# zprof for debug init time
# zmodload zsh/zprof

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:$HOME/TOOLS/myscript
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export LC_CTYPE=UTF-8
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    fast-syntax-highlighting
    fzf-tab
    docker
    docker-compose
    zsh-autosuggestions
    zsh-completions
    autojump
    history-substring-search
    command-not-found
)

source $ZSH/oh-my-zsh.sh
source $HOME/.env

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi
#Edit command in vim
autoload -U edit-command-line
bindkey '^e' edit-command-line
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vinid-bastion='eval ssh-agent -s
ssh-add ~/.ssh/google_compute_engine
gcloud beta compute --project "vinid-app-common-prod" ssh --zone "asia-east1-c" "bastion" --ssh-flag="-A"'
alias vinid-jump55='gcloud beta compute ssh --zone "asia-east1-c" "bastion-vhud" --tunnel-through-iap --project "vinid-app-common-prod" --ssh-flag="-L 9001:10.255.24.55:3389"'
alias o='open'
alias qq='exit'
alias vcf='cd ~/.config/nvim/configs && v .'
alias zcf="nvim ~/.zshrc"
alias tcf="nvim ~/.tmux.conf"
alias omzcf="nvim ~/.oh-my-zsh"
alias sz="source ~/.zshrc"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias bluebox='ssh hungvq@bluebox'
alias tmux="tmux -2"
alias t='tmux'
alias v="nvim"
alias vim="nvim"
alias fv='v $(fzf --height 95% --preview "bat --style=numbers --color=always --line-range :700 {}")'
alias color='for i in {0..255}; do printf "\x1b[38;5;${i}mcolor%-5i\x1b[0m" $i ; if ! (( ($i + 1 ) % 8 )); then echo ; fi ; done'
alias clock='while :; do printf "%s\r" "$(date +%r)"; sleep 1 ; done'
alias weather="curl wttr.in"
alias sharetext="curl -F 'clbin=<-' https://clbin.com"
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias fk='kill -9 $(fzf)'
alias logcat='logcat-color'
# alias semgrep='docker run --rm -v "${PWD}:/home/repo" returntocorp/semgrep'
# alias trans='docker run -it --rm soimort/translate-shell :vi+en'
# alias mobsf='docker start -i mobsf'
# alias sqlmap='python3 $HOME/TOOLS/sqlmap/sqlmap.py'
# alias dpclean="docker rm `docker ps -aq`"
alias glr='find . -type d -name .git  -exec sh -c "cd \"{}\"/../ && pwd && git pull" \;'
alias adb_listpackage='adb shell pm list packages | fzf  | cut -d':' -f2'
# function
is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

fzf-down() {
  fzf-tmux --height 95% "$@" --border
}

fgb() {
  is_in_git_repo || return
  git branch -a --color=always | grep -v '/HEAD\s' | sort |
  fzf-down --ansi --multi --tac --preview-window right:70% \
    --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1) | head -'$LINES |
  sed 's/^..//' | cut -d' ' -f1 |
  sed 's#^remotes/##'
}

fgt() {
  is_in_git_repo || return
  git tag --sort -version:refname |
  fzf-down --multi --preview-window right:70% \
    --preview 'git show --color=always {} | head -'$LINES
}

fgh() {
  is_in_git_repo || return
  git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
  fzf --height 92%  --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
    --header 'Press CTRL-S to toggle sort' \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always | head -'$LINES |
  grep -o "[a-f0-9]\{7,\}"
}


# fbr - checkout git branch
fbr() {
  local branches branch
  branches=$(git branch) &&
  branch=$(echo "$branches" | fzf-tmux -d 15 +m) &&
  git checkout $(echo "$branch" | sed "s/.* //")
}
geoip () {
    curl ipinfo.io/"$1"
}

shorturl () {
    curl -s http://tinyurl.com/api-create.php\?url\="$1"
}

qr () {
    curl qrenco.de/"$1"
}

cheat () {
    curl cheat.sh/"$1" | bat
}

ip () {
    ipconfig getifaddr en0
}
burp () {
    # export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_251.jdk/Contents/Home"
    java --illegal-access=permit -Dfile.encoding=utf-8 -javaagent:$HOME/TOOLS/burp/lastest/BurpSuiteLoader.jar -noverify -jar $HOME/TOOLS/burp/lastest/burpsuite_pro.jar
}
# c - browse chrome history
c() {
  local cols sep
  cols=$(( COLUMNS / 3 ))
  sep='{::}'

  cp -f ~/Library/Application\ Support/Google/Chrome/Default/History /tmp/h

  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs open
}
curltime() {
    curl -so /dev/null -w "\
   namelookup:  %{time_namelookup}s\n\
      connect:  %{time_connect}s\n\
   appconnect:  %{time_appconnect}s\n\
  pretransfer:  %{time_pretransfer}s\n\
     redirect:  %{time_redirect}s\n\
starttransfer:  %{time_starttransfer}s\n\
-------------------------\n\
        total:  %{time_total}s\n" "$@"
}
chpwd() l
#---------------------------------------- ANDDROID -------------------------------------------
export ANDROID_HOME='/Users/hungvq10/Library/Android/sdk'
export ANDROID_SDK=$HOME/Library/Android/sdk
export PATH=$ANDROID_SDK/emulator:$ANDROID_SDK/tools:$PATH
export PATH=$PATH:$ANDROID_SDK/platform-tools
export PATH=$PATH:$ANDROID_SDK/build-tools/29.0.3
# genymotion adb
export PATH=/Applications/Genymotion.app/Contents/MacOS/tools:$PATH

#---------------------------------------- JAVA -----------------------------------------------
# export JDK_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_251.jdk"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-11.0.7.jdk/Contents/Home"
export JDK_HOME="/Library/Java/JavaVirtualMachines/jdk-11.0.7.jdk/Contents/Home"

#---------------------------------------- GCLOUD SDK -----------------------------------------
export CLOUDSDK_PYTHON=python2
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/hungvq10/TOOLS/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/hungvq10/TOOLS/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/hungvq10/TOOLS/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/hungvq10/TOOLS/google-cloud-sdk/completion.zsh.inc'; fi

#---------------------------------------- FLUTTER --------------------------------------------
export PATH="$PATH:$HOME/flutter/bin"

#---------------------------------------- FZF ------------------------------------------------
# fzf config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# fzf + bat 
export FZF_DEFAULT_OPTS='--height 75% --layout=reverse --border'
export FZF_COMPLETION_OPTS=""
export FZF_COMPLETION_TRIGGER='ff'

# Options to fzf command
export FZF_COMPLETION_OPTS='+c -x'

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# (EXPERIMENTAL) Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf "$@" --preview 'tree -C {} | head -200' ;;
    export|unset) fzf "$@" --preview "eval 'echo \$'{}" ;;
    ssh)          fzf "$@" --preview 'dig {} | bat' ;;
    *)            fzf "$@" ;;
  esac
}

#---------------------------------------- NVM ------------------------------------------------
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#---------------------------------------- VAGRANT ------------------------------------------------
# >>>> Vagrant command completion (start)
fpath=(/opt/vagrant/embedded/gems/2.2.14/gems/vagrant-2.2.14/contrib/zsh $fpath)
compinit
# <<<<  Vagrant command completion (end)

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
# zprof for debug init time
# zprof