class RepositoriesController < ApplicationController
  def index
    @connection = Faraday.new(url: "https://api.github.com") do |faraday|
        faraday.adapter Faraday.default_adapter
      end

    response = @connection.get("/user/repos?access_token=#{current_user.token}")

    @repos = JSON.parse(response.body, symbolize_names: true)

    @repos = @repos.map do |repo_data|
      Repository.new(repo_data)
    end
  end
end
