class RepoPresenter < ApplicationRecord
  def self.repositories(token)
    response = GithubService.get_api.get("/user/repos?access_token=#{token}")
    repos = JSON.parse(response.body, symbolize_names: true)
    repos = repos.map do |repo_data|
      Repository.new(repo_data)
    end
  end
end
