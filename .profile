# written using bash syntax
# shared configuration for either bash or zsh

# add local user-level bin to path
PATH="$PATH:/home/matt/bin"
PATH="$PATH:/usr/local/texlive/2014/bin/x86_64-linux"
PATH="$PATH:/home/matt/.gem/ruby/2.2.0/bin"
export PATH

# some stuff that bundler needs to properly install stuff locally, rather than
# globally for the system.
GEM_HOME=/home/matt/.gem/ruby/2.2.0
export GEM_HOME
function battery() {
    acpi -i
}

# changes font size used for urxvt in current terminal
function change_font_size() {
    echo -e "\033]710;-xos4-terminus-medium-*-*-*-$1-*-*-*-*-*-iso10646-1\033\\"
}


export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
#currently wrong: the mode setting in probably unnecessary and will break if not
# the same monitor as in the TA lab
function hdmi-107() {
    xrandr --output HDMI1 --mode 1920x1200 --right-of LVDS1
}
function hdmi-love() {
    xrandr --output HDMI1 --mode 1920x1080 --right-of LVDS1
}

ssh-add -l > /dev/null || alias ssh='ssh-add -l > /dev/null || ssh-add ~/.ssh/archrazz && unalias ssh; ssh'

alias ls='ls --color=auto'

