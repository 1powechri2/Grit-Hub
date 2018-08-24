class Commit
  attr_reader :name, :message, :url

  def initialize(data)
    @name = data[:commit][:author][:name]
    @message = data[:commit][:message]
    @url = data[:html_url]
  end
end
