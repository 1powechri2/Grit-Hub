class FollowerPresenter
  def self.get_followers(name, token)
    response = GithubService.get_api.get("/users/#{name}/followers?access_token=#{token}")
    followers = JSON.parse(response.body, symbolize_names: true)
    followers.map do |follower_data|
      Follower.new(follower_data)
    end
  end
end
