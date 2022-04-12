. /etc/profile

export PATH="$HOME/.local/bin/win:$HOME/.local/bin:$PATH"
export EDITOR=vim
export VISUAL=vim
export TERMINAL=kitty
export BROWSER=ungoogled-chromium

# export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" # This line will break some DMs
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
export LESSHISTFILE="-"
export CCACHE_DIR="$HOME/.cache/ccache"
export GNUPGHOME="$HOME/.config/gnupg"
export PASSWORD_STORE_DIR="$HOME/.config/password-store"
export WINEPREFIX="$HOME/.local/share/wine"

if [ "$(tty)" = "/dev/tty1" ]; then
    exec startx
fi

[ "$(tty)" = "/dev/tty2" ] &&
    exec startx -- :1
