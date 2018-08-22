class RepoPresenter

  def initialize(name, token)
    @name = name
    @service = GithubService.new(name, token)
  end

  def repos
    @service.repos_json
  end

  def repositories
    repos.map do |repo_data|
      Repository.new(repo_data)
    end
  end

  def most_recent_repositories
    repositories.map do |repo|
      if Date.parse(repo.updated_at) > Date.today - 5
        repo
      end
    end.compact
  end
end
