class UsersController < ApplicationController
  def show
    @followers = FollowerPresenter.get_followers(current_user.name, current_user.token)
    @followings = FollowingPresenter.get_followings(current_user.name, current_user.token)
  end
end
