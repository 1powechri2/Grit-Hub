require 'rails_helper'

describe CommitUrl do
  context 'initialize' do
    it 'gets created' do
      attributes = {:sha=>"caa17c9725c7c4c71b955fd9fcbc72cd43785d3d",
                    :author=>{:email=>"chris.ian.powell@gmail.com", :name=>"Chris Powell"},
                    :message=>"adds items business functionality for most items sold",
                    :distinct=>false,
                    :url=>"https://api.github.com/repos/1powechri2/Rails-Engine/commits/caa17c9725c7c4c71b955fd9fcbc72cd43785d3d"}

      commit = CommitUrl.new(attributes)

      expect(commit.url).to eq("https://api.github.com/repos/1powechri2/Rails-Engine/commits/caa17c9725c7c4c71b955fd9fcbc72cd43785d3d")
    end
  end
end
