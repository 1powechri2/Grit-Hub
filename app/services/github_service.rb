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

  def get_repos
    @get_repos ||= connect.get("/user/repos?access_token=#{@token}")
  end

  def get_repo_commits(name)
    connect.get("/repos/#{@name}/#{name}/commits?access_token=#{@token}")
  end

  def get_followers
    @get_followers ||= connect.get("/users/#{@name}/followers?access_token=#{@token}")
  end

  def get_followings
    @get_followings ||= connect.get("/users/#{@name}/following?access_token=#{@token}")
  end

  def repo_commits_json(name)
    JSON.parse(get_repo_commits(name).body, symbolize_names: true)
  end

  def repos_json
    JSON.parse(get_repos.body, symbolize_names: true)
  end

  def followers_json
    JSON.parse(get_followers.body, symbolize_names: true)
  end

  def followings_json
    JSON.parse(get_followings.body, symbolize_names: true)
  end
end
