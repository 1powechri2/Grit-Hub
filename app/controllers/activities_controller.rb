class ActivitiesController < ApplicationController
  def index
    @commits = ActivitiesPresenter.new(current_user.name, current_user.token).commits
  end
end
