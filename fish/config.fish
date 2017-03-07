set -x SHELL /usr/local/bin/fish
set -x GOPATH $HOME/.go
set -x PATH ~/.rvm/gems/ruby-2.2.6/bin /usr/local/opt/coreutils/libexec/gnubin /usr/local/sbin $PATH $GOPATH/bin ~/.cargo/bin ~/bin
set -x MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH
set -x EDITOR vim
source {$HOME}/.github
set -e fish_greeting

if [ -f /usr/share/autojump/autojump.fish ]
	source /usr/share/autojump/autojump.fish
end

source ~/.config/fish/abbreviations.fish

keychain --eval id_rsa > /dev/null ^ /dev/null
start_ssh_agent

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
rvm default
