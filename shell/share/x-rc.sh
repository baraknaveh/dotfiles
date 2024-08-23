#
# Source this file from bash or zsh for shared prefs
#

# Keep a very large history (arbitrary choice)
export HISTSIZE=1000000
export SAVEHIST=1000000

# Set vi as an editor whenever possible
export EDITOR=vim
set -o vi

# Colored less. Requires installing Pygments
cless() {
    LESS="--RAW-CONTROL-CHARS" LESSOPEN="| pygmentize %s" less "$@"
}

find_up() {
    if [ $# != 1 ]; then
        echo "Usage: find_up <dir>" 1>&2
    fi
    dir="$1"
    for i in $(seq 0 $(pwd|tr -cd '/'|wc -c)); do
        if [ -d "$dir" ]; then
            echo "$dir"
            return 0
        else
            dir="../$dir"
        fi
    done
    echo "$1 not found"
    return 1
}

export LESS="--RAW-CONTROL-CHARS"

# Some useful shortcuts
alias ll="ls -la"
gd() {
    if find_up .git > /dev/null; then
        git diff "$@"
    elif find_up .hg > /dev/null; then
        hg diff "$@"
    else
        echo "Not under VCS"
    fi
}
gl() {
    if find_up .git > /dev/null; then
        git log --all --graph --pretty=format:'%C(auto)%h%Creset%C(auto)%d%Creset %s %C(magenta bold)(%cr)%Creset %C(cyan)<%aN>%Creset' "$@"
    elif find_up .hg > /dev/null; then
        hg log "$@"
    else
        echo "Not under VCS"
    fi
}
st() {
    if find_up .git > /dev/null; then
        git status "$@"
    elif find_up .hg > /dev/null; then
        hg status "$@"
    else
        echo "Not under VCS"
    fi
}
br() {
    if find_up .git > /dev/null; then
        git branch "$@"
    elif find_up .hg > /dev/null; then
        hg book "$@"
    else
        echo "Not under VCS"
    fi
}
rb() {
    if find_up .git > /dev/null; then
        git rebase "$@"
    elif find_up .hg > /dev/null; then
        hg rebase "$@"
    else
        echo "Not under VCS"
    fi
}
gfrb() {
    if find_up .git > /dev/null; then
        git fetch; git rebase "$@"
    elif find_up .hg > /dev/null; then
        hg pull; hg rebase "$@"
    else
        echo "Not under VCS"
    fi
}

alias gt="git difftool"
alias tmux="tmux -2"
alias grep="grep --color=auto"
alias ..="cd .."
alias dof="cd ~/dotfiles"
alias tc="cd ~/tcode"
alias main="git switch main"
alias swc="git switch -c "

# LS_COLORS seems to not be needed anymore (2023-02-10)
# export LS_COLORS='rs=0:di=38;5;27:ln=38;5;51:mh=44;38;5;15:pi=40;38;5;11:so=38;5;13:do=38;5;5:bd=48;5;232;38;5;11:cd=48;5;232;38;5;3:or=48;5;232;38;5;9:mi=05;48;5;232;38;5;15:su=48;5;196;38;5;15:sg=48;5;11;38;5;16:ca=48;5;196;38;5;226:tw=48;5;10;38;5;16:ow=48;5;10;38;5;21:st=48;5;21;38;5;15:ex=38;5;34:*.tar=38;5;9:*.tgz=38;5;9:*.arj=38;5;9:*.taz=38;5;9:*.lzh=38;5;9:*.lzma=38;5;9:*.tlz=38;5;9:*.txz=38;5;9:*.zip=38;5;9:*.z=38;5;9:*.Z=38;5;9:*.dz=38;5;9:*.gz=38;5;9:*.lz=38;5;9:*.xz=38;5;9:*.bz2=38;5;9:*.tbz=38;5;9:*.tbz2=38;5;9:*.bz=38;5;9:*.tz=38;5;9:*.deb=38;5;9:*.rpm=38;5;9:*.jar=38;5;9:*.rar=38;5;9:*.ace=38;5;9:*.zoo=38;5;9:*.cpio=38;5;9:*.7z=38;5;9:*.rz=38;5;9:*.jpg=38;5;13:*.jpeg=38;5;13:*.gif=38;5;13:*.bmp=38;5;13:*.pbm=38;5;13:*.pgm=38;5;13:*.ppm=38;5;13:*.tga=38;5;13:*.xbm=38;5;13:*.xpm=38;5;13:*.tif=38;5;13:*.tiff=38;5;13:*.png=38;5;13:*.svg=38;5;13:*.svgz=38;5;13:*.mng=38;5;13:*.pcx=38;5;13:*.mov=38;5;13:*.mpg=38;5;13:*.mpeg=38;5;13:*.m2v=38;5;13:*.mkv=38;5;13:*.ogm=38;5;13:*.mp4=38;5;13:*.m4v=38;5;13:*.mp4v=38;5;13:*.vob=38;5;13:*.qt=38;5;13:*.nuv=38;5;13:*.wmv=38;5;13:*.asf=38;5;13:*.rm=38;5;13:*.rmvb=38;5;13:*.flc=38;5;13:*.avi=38;5;13:*.fli=38;5;13:*.flv=38;5;13:*.gl=38;5;13:*.dl=38;5;13:*.xcf=38;5;13:*.xwd=38;5;13:*.yuv=38;5;13:*.cgm=38;5;13:*.emf=38;5;13:*.axv=38;5;13:*.anx=38;5;13:*.ogv=38;5;13:*.ogx=38;5;13:*.aac=38;5;45:*.au=38;5;45:*.flac=38;5;45:*.mid=38;5;45:*.midi=38;5;45:*.mka=38;5;45:*.mp3=38;5;45:*.mpc=38;5;45:*.ogg=38;5;45:*.ra=38;5;45:*.wav=38;5;45:*.axa=38;5;45:*.oga=38;5;45:*.spx=38;5;45:*.xspf=38;5;45:'

case `uname` in
Darwin)
    # Trying to give bash on Mac colors similar to Linux.
    # LSCOLORS generator: http://geoff.greer.fm/lscolors/
    export CLICOLOR=1
    export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

    # If latest vim was installed by brew, used it instead the OSX default

    # if [ -f /usr/local/bin/vim ]
    # then
    #     alias vim=/usr/local/bin/vim
    #     alias vi=/usr/local/bin/vim
    #     alias vimdiff=/usr/local/bin/vim
    # fi

    # Set PATH, MANPATH, etc., for Homebrew.
    if [ -f /opt/homebrew/bin/brew ]
    then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
    ;;
Linux)
    ;;
esac

# If we do Rust on this machine, add cargo bin to path
if [ -d "$HOME/.cargo" ]
then
    export PATH="$PATH:$HOME/.cargo/bin"
fi

# Dedupe the $PATH
CLEAN_PATH=""
for p in `echo "$PATH" | tr ":" "\n"`
do
    if [[ ! ":$CLEAN_PATH:" =~ ":$p:" ]]; then
        CLEAN_PATH="$CLEAN_PATH$p:"
    fi
done
export PATH="${CLEAN_PATH%:}"
unset CLEAN_PATH

# Makes an audible cue. E.g., to notify that a long operation finished.
tada() {
    for i in {1..5}
    do
        printf '\a'
        sleep 0.2
    done
}

# Follow the advice given here:
# http://seclists.org/fulldisclosure/2014/Nov/74
# "on Linux, 'less' can probably get you owned"
unset LESSOPEN
unset LESSCLOSE

# Use sccache to speed up cargo builds
export RUSTC_WRAPPER="sccache"

# Set up Docker env and completion
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
