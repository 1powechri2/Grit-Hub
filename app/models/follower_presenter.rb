class FollowerPresenter

  def initialize(name, token)
    @name  = name
    @service = GithubService.new(name, token)
  end

  def get_followers
    @service.followers_json.map do |follower_data|
      Follower.new(follower_data)
    end
  end
end
