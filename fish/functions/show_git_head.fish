function show_git_head
    pretty_git_log -1
    git show -p --pretty="format:"
end
