class UsersController < ApplicationController
  def show
    @followers = FollowerPresenter.new.get_followers(current_user.name, current_user.token)
    @followings = FollowingPresenter.new.get_followings(current_user.name, current_user.token)
  end
end
