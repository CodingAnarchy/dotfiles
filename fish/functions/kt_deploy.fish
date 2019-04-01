function kt_deploy --description 'deploy KT develop branch to prod'
  if string match -q -- "true" (git rev-parse --is-inside-work-tree); and string match -q -- "*kangarootime.git" (git remote get-url origin)
    git sync
    git checkout master
    git pull origin develop
    git push
    bcap production deploy
  else
    echo "This is not the Kangarootime repository."
  end
end
