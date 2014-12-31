task :release => ['git:release', 'middlman:release']

namespace :git do
    task :release => [:require_clean, :tag, :push]

    task :require_clean do
        abort "Git working directory status is not clean:\n#{`git status`}" unless `git status --porcelain`.empty?
    end

    task :tag do
        tag = "release-#{`git log -1 --format='%h'`}"
        sh "git tag -f #{tag}"
    end

    task :push do
        sh "git push --tags"
    end
end



namespace :middlman do
    task :release => [:build, :sync]

    task :build do
        sh "middleman build"
    end

    task :sync do
        sh "middleman s3_sync"
    end

end
