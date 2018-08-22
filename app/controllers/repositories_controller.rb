class RepositoriesController < ApplicationController
  def index
    @repos = RepoPresenter.new(current_user.name, current_user.token).repositories
  end
end
