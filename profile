# tmux runs a login shell. So it doesn't load ~/.bashrc. It load this file, so 
# we need to source bashrc
source ~/.bashrc
export GPG_TTY=$(tty)
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
