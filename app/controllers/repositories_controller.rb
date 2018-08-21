class RepositoriesController < ApplicationController
  def index
    @repos = RepoPresenter.repositories(current_user.token)
  end
end
