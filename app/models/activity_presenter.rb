class ActivityPresenter

  def initialize(name, token)
    @token   = token
    @service = GithubService.new(name, token)
  end

  def recent_activities
    repo_commits.each do |data|
      @commits = data.map do |commit_data|
        Commit.new(commit_data)
      end
    end
    @commits
  end

  def repo_commits
    latest_repos.map do |repo|
      @service.repo_commits_json(repo.name)
    end
  end

  def latest_repos
    RepoPresenter.new(@name, @token).most_recent_repositories
  end
end
