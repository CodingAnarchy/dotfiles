# Log output:
#
# * 51c333e    (12 days)    <Gary Bernhardt>   add vim-eunuch
#
# The time massaging regexes start with ^[^<]* because that ensures that they
# only operate before the first "<". That "<" will be the beginning of the
# author name, ensuring that we don't destroy anything in the commit message
# that looks like time.
#
# The log format uses } characters between each field, and `column` is later
# used to split on them. A } in the commit subject or any other field will
# break this.

function pretty_git_log

    set HASH "%C(yellow)%h%Creset"
    set RELATIVE_TIME "%Cgreen(%ar)%Creset"
    set AUTHOR "%C(bold blue)<%an>%Creset"
    set REFS "%C(bold red)%d%Creset"
    set SUBJECT "%s"

    set FORMAT "$HASH}$RELATIVE_TIME}$AUTHOR}$REFS $SUBJECT"

    set ANSI_BLACK '\033[30m'
    set ANSI_BLACK_BOLD '\033[0;30;1m'
    set ANSI_RED '\033[31m'
    set ANSI_RED_BOLD '\033[0;31;1m'
    set ANSI_GREEN '\033[32m'
    set ANSI_GREEN_BOLD '\033[0;32;1m'
    set ANSI_YELLOW '\033[33m'
    set ANSI_YELLOW_BOLD '\033[0;33;1m'
    set ANSI_BLUE '\033[34m'
    set ANSI_BLUE_BOLD '\033[0;34;1m'
    set ANSI_MAGENTA '\033[35m'
    set ANSI_MAGENTA_BOLD '\033[0;35;1m'
    set ANSI_CYAN '\033[36m'
    set ANSI_CYAN_BOLD '\033[0;36;1m'
    set ANSI_WHITE '\033[37m'
    set ANSI_WHITE_BOLD '\033[0;37;1m'
    set ANSI_RESET '\033[0m'

    git log --graph --pretty="format:$FORMAT" $argv | \
    sed -Ee 's/(^[^<]*) ago\)/\1)/' |\
    sed -Ee 's/(^[^<]*), [[:digit:]]+ .*months?\)/\1)/' | \
    column -s '}' -t | \
    sed -Ee 's/(Merge (branch|remote-tracking-branch|pull request) .*$)/'(printf $ANSI_RED)"\1"(printf $ANSI_RESET)"/" | \
    if test -n "$GIT_NO_PAGER"
        cat
    else
        # Page only if needed
        less --quit-if-one-screen --no-init --RAW-CONTROL-CHARS --chop-long-lines
    end
end
