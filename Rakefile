task :release => [:git_push, :middleman_push]

task :git_push do
    abort "Git working directory status is not clean:\n#{`git status`}" unless `git status --porcelain`.empty?
    sh "git push"
end

task :middleman_push do
    sh "middleman build"
    sh "middleman s3_sync"
end
