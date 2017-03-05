function lss --description "Show more detailed 'ls' output"
    set -x CLICOLOR_FORCE 1
    ls -lahc $argv | less -XRF
end
