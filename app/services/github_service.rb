class GithubService
  def self.get_api
    @connection = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end
