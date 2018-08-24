class ActivitiesPresenter
  def initialize(name, token)
    @service = GithubService.new(name, token)
    @token = token
  end

  def event_data
    @service.events_json
  end

  def collect_event_commit_data
    event_data.map do |event|
      if event[:type] == 'PushEvent'
        event[:payload][:commits]
      end
    end.compact.flatten
  end

  def compile_commit_urls
    collect_event_commit_data.map do |commit_url|
      CommitUrl.new(commit_url)
    end
  end

  def commits
    compile_commit_urls.map do |commit_data|
    data = Faraday.get(commit_data.url)
    json = JSON.parse(data.body, symbolize_names: true)
    Commit.new(json)
    end
  end
end
