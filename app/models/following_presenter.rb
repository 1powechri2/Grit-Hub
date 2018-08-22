class FollowingPresenter
  def get_followings(name, token)
    response = GithubService.new(name, token).connect.get("/users/#{name}/following?access_token=#{token}")
    followings = JSON.parse(response.body, symbolize_names: true)
    followings.map do |follower_data|
      Following.new(follower_data)
    end
  end
end
