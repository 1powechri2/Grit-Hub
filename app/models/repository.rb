class Repository
  attr_reader :name, :description, :url, :created_at, :updated_at

  def initialize(data)
    @name        = data[:name]
    @description = descritption_helper(data)
    @url         = data[:html_url]
    @created_at  = data[:created_at]
    @updated_at  = data[:updated_at]
  end

  def descritption_helper(data)
    if data[:description]
      data[:description]
    else
      'No Description'
    end
  end
end
