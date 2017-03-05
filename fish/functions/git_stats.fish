function git_stats --description="Retrieve statistics for a git repository"
    set -g file_pattern $argv
    for rev in (revisions)
        echo (number_of_lines $rev) (commit_description $rev)
    end
end

function revisions
    git rev-list --reverse HEAD
end

function commit_description
    git log --oneline -1 $argv
end

function number_of_lines
    git ls-tree -r $argv | \
    grep "$file_pattern" | \
    awk '{print $3}' | \
    xargs git show | \
    wc -l
end
