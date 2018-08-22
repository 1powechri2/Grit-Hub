class GithubService
  def initialize(name = nil, token = nil)
    @name  = name
    @token = token
  end

  def connect
    Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_repo_commits(name)
    @get_repo_commits ||= connect.get("/repos/#{@name}/#{name}/commits?access_token=#{@token}")
  end

  def get_repos
    @get_repos ||= connect.get("/user/repos?access_token=#{@token}")
  end

  def repo_commits_json(name)
    JSON.parse(get_repo_commits(name).body, symbolize_names: true)
  end

  def repos_json
    JSON.parse(get_repos.body, symbolize_names: true)
  end
end
