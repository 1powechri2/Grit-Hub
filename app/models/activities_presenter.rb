class ActivitiesPresenter
  def initialize(name, token)
    @name = name
    @token = token
  end

  def commits
    call = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.adapter Faraday.default_adapter
    end

    response = call.get("/users/#{@name}/events?access_token=#{@token}")

    json = JSON.parse(response.body, symbolize_names: true)

    events = json.map do |event|
        event[:payload][:commits]
    end.compact.flatten

    commit_api_url = events.map do |api_url|
      CommitUrl.new(api_url)
    end

    commits = commit_api_url.map do |commit_data|
      data = Faraday.get(commit_data.url)
      json = JSON.parse(data.body, symbolize_names: true)
      Commit.new(json)
    end
  end
end
