class Follower
  attr_reader :login, :url

  def initialize(data)
    binding.pry
    @login = data[:login]
    @url   = data[:html_url]
  end
end
