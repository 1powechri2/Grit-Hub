class ActivityPresenter
  def self.recent_activities(name, token, repos)
    raw_data = repo_commits(name, token, repos)

    raw_data.each do |data|
      @commits = data.map do |commit_data|
        Commit.new(commit_data)
      end
    end
    @commits
  end

  def self.repo_commits(name, token, repos)
    repos.map do |repo|
      response = GithubService.get_api.get("/repos/#{name}/#{repo.name}/commits?access_token=#{token}")
      commit_data = JSON.parse(response.body, symbolize_names: true)
    end
  end
end
