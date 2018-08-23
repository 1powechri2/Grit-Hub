class UsersController < ApplicationController
  def show
    # @followers = FollowerPresenter.new(current_user.name, current_user.token).get_followers
    # @followings = FollowingPresenter.new(current_user.name, current_user.token).get_followings
  end
end
