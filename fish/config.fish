set -x SHELL /usr/local/bin/fish
set -x GOPATH $HOME/.go
set -x PATH /usr/local/opt/coreutils/libexec/gnubin /usr/local/sbin $PATH ~/bin
set -x MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH
set -x EDITOR vim
source {$HOME}/.github
set -x GPG_TTY (tty)
set -e fish_greeting

if [ -f /usr/share/autojump/autojump.fish ]
  source /usr/share/autojump/autojump.fish
end

function nvm
  bass source (brew --prefix nvm)/nvm.sh --no-use ';' nvm $argv
end

source ~/.config/fish/abbreviations.fish

keychain --eval id_rsa > /dev/null ^ /dev/null
start_ssh_agent

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
#nvm use default --silent

brew command command-not-found-init > /dev/null 2>&1; and . (brew command-not-found-init)
status --is-interactive; and source (rbenv init -|psub)
