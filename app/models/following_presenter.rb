class FollowingPresenter
  def self.get_followings(name, token)
    response = GithubService.get_api.get("/users/#{name}/following?access_token=#{token}")
    followings = JSON.parse(response.body, symbolize_names: true)
    followings.map do |follower_data|
      Following.new(follower_data)
    end
  end
end
