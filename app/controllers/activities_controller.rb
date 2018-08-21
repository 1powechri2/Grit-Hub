class ActivitiesController < ApplicationController
  def index
    repositories = RepoPresenter.most_recent_repositories(current_user.token)
    @recent_activities = ActivityPresenter.recent_activities(current_user.name, current_user.token, repositories)
  end
end
