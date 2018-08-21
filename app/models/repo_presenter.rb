class RepoPresenter
  def self.repositories(token)
    response = GithubService.get_api.get("/user/repos?access_token=#{token}")
    repos = JSON.parse(response.body, symbolize_names: true)
    repos = repos.map do |repo_data|
      Repository.new(repo_data)
    end
  end

  def self.most_recent_repositories(token)
    recent = self.repositories(token)

    thing = recent.map do |repo|
      if Date.parse(repo.updated_at) > Date.today - 5
        repo
      end
    end.compact
  end
end
