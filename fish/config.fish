set -x SHELL /usr/local/bin/fish
set -x GOPATH $HOME/.go
set -x PATH /usr/local/sbin /usr/local/opt/coreutils/libexec/gnubin $PATH $GOPATH/bin ~/bin
set -x MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH
set -x EDITOR vim
set -x HOMEBREW_BOOTSNAP 1

set -x GPG_TTY (tty)
set -e fish_greeting

if [ -f /usr/share/autojump/autojump.fish ]
  source /usr/share/autojump/autojump.fish
end

source ~/.config/fish/abbreviations.fish

keychain --eval id_rsa > /dev/null ^ /dev/null
start_ssh_agent

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

brew command command-not-found-init > /dev/null 2>&1; and . (brew command-not-found-init)

[ -f "~/.config/fish/conf.d/canary.fish" ]; and source "~/.config/fish/conf.d/canary.fish"
