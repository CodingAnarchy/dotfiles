function byscripts_decorate

	echo -n " "

	if [ (count $argv) -gt 1 ]
		set_color $argv[2..(count $argv)]
	end

	echo -n $argv[1]
	set_color $fish_color_normal

end

function byscripts_prompt_date
    byscripts_decorate (date +%H:%M:%S) "cc0"
end

function byscripts_prompt_hostname
  set -l who (whoami)
  if [ -n "$SSH_CLIENT" ]; or [ -n "$SSH_TTY" ]
    set -l who (whoami)"@"(hostname)
  end

	if [ (whoami) = 'root' ]
		byscripts_decorate $who "red" "--underline"
	else
	  byscripts_decorate $who "cyan"
	end
end

function byscripts_prompt_git

	set -g __fish_git_prompt_show_informative_status 1
	set -g __fish_git_prompt_showcolorhints 1
	set -g ___fish_git_prompt_char_stateseparator " "

	set -l prompt (__fish_git_prompt "%s")

	if [ -n "$prompt" ]
		byscripts_decorate $prompt
	end
end

function byscripts_prompt_cwd
	byscripts_decorate (prompt_pwd) yellow
end

function _rb_prompt
  echo (ruby --version | awk '{print $2}' | cut -d 'p' -f1)
end

function byscripts_prompt_ruby
  byscripts_decorate (_rb_prompt) 'brred'
end

function fish_prompt

	byscripts_prompt_git
  byscripts_prompt_ruby
	byscripts_prompt_hostname
	byscripts_prompt_date
	byscripts_prompt_cwd

	echo -n " >"

end
