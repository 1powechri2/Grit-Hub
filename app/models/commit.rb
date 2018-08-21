class Commit
  attr_reader :author, :message, :url

  def initialize(data)
    @author = data[:commit][:author][:name]
    @message = data[:commit][:message]
    @url = data[:html_url]
  end
end
