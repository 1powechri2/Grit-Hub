class Commit
  attr_reader :author, :message, :date, :url

  def initialize(data)
    @author = data[:commit][:author][:name]
    @message = data[:commit][:message]
    @date = data[:commit][:author][:date]
    @url = data[:html_url]
  end
end
