. ~/.config/bash/sensible.bash
. ~/.config/bash/bash-powerline.sh
. ~/.config/bash/key-bindings.bash
. ~/.cache/wal/colors.sh

# Automatically trim long paths in the prompt
PROMPT_DIRTRIM=3

#export PS1="\[$(tput bold)$(tput setf 7)${debian_chroot:+($debian_chroot)}\u@\h:\w\\[$(tput sgr0)\n$ "

alias ls='ls --color --group-directories-first'
alias l='ls -lah'
alias ll='ls -lh'
alias c=clear
alias cl='c && l'
alias grep='grep --color=auto'

alias ai="sudo pacman -S"
alias au="sudo pacman -Syyuu"
alias ar="sudo pacman -Rsu"
alias ap="sudo apt-get purge"
alias aa="sudo apt-get autoremove"
alias as="pacman -Ss"

alias v=vim
alias rm=trash
alias open=xdg-open
alias wget="wget --hsts-file=$HOME/.local/share/wget-hsts"
alias lmk='latexmk -output-format=pdf -pvc'

alias d=docker

# Huge history. Doesn't appear to slow things down, so why not?
HISTSIZE=5000000
HISTFILESIZE=1000000
export HISTIGNORE="&:[ ]*:exit:ls:l:ll:fg:history:clear:c:v:aa:au:ag:.."

# Disk Speed Test https://www.shellhacks.com/disk-speed-test-read-write-hdd-ssd-perfomance-linux/
# benchmark write (Test Disk Write Speed)
alias bw="sync; dd if=/dev/zero of=tempfile bs=1M count=1024; sync"
# benchmark read (Test Disk Read Speed)
alias br="sudo /sbin/sysctl -w vm.drop_caches=3; dd if=tempfile of=/dev/null bs=1M count=1024"

complete -W "$(tldr 2>/dev/null --list)" tldr
complete -W "$(ls --color=never ~/.local/bin)" mkscript
