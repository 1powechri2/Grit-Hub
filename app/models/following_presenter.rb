class FollowingPresenter
  def initialize(name, token)
    @name    = name
    @service = GithubService.new(name, token)
  end

  def get_followings
    @service.followings_json.map do |follower_data|
      Following.new(follower_data)
    end
  end
end
