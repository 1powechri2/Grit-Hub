class ActivitiesController < ApplicationController
  def index
    @recent_activities = ActivityPresenter.new(current_user.name, current_user.token).recent_activities
  end
end
