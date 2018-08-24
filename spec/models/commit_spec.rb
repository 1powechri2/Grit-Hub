require 'rails_helper'

describe Commit do
  context 'initialize' do
    it 'gets created' do
      attributes = {:sha=>"b2e705773e1072948cfd47aa165874f75116348f",
                   :node_id=>"MDY6Q29tbWl0MTQ1NDg2ODEwOmIyZTcwNTc3M2UxMDcyOTQ4Y2ZkNDdhYTE2NTg3NGY3NTExNjM0OGY=",
                   :commit=>
                    {:author=>{:name=>"Chris Powell", :email=>"chris.ian.powell@gmail.com", :date=>"2018-08-22T21:33:59Z"},
                     :committer=>{:name=>"Chris Powell", :email=>"chris.ian.powell@gmail.com", :date=>"2018-08-22T21:33:59Z"},
                     :message=>"adds refactors for activity presenter and repo presenter",
                     :tree=>
                      {:sha=>"2b3d7b4526e53f5631cc884a08695bf0ce779d15",
                       :url=>"https://api.github.com/repos/1powechri2/Grit-Hub/git/trees/2b3d7b4526e53f5631cc884a08695bf0ce779d15"},
                     :url=>"https://api.github.com/repos/1powechri2/Grit-Hub/git/commits/b2e705773e1072948cfd47aa165874f75116348f",
                     :comment_count=>0,
                     :verification=>{:verified=>false, :reason=>"unsigned", :signature=>nil, :payload=>nil}},
                   :url=>"https://api.github.com/repos/1powechri2/Grit-Hub/commits/b2e705773e1072948cfd47aa165874f75116348f",
                   :html_url=>"https://github.com/1powechri2/Grit-Hub/commit/b2e705773e1072948cfd47aa165874f75116348f",
                   :comments_url=>"https://api.github.com/repos/1powechri2/Grit-Hub/commits/b2e705773e1072948cfd47aa165874f75116348f/comments"}


      commit = Commit.new(attributes)

      expect(commit.name).to eq("Chris Powell")
      expect(commit.message).to eq("adds refactors for activity presenter and repo presenter")
      expect(commit.url).to eq("https://github.com/1powechri2/Grit-Hub/commit/b2e705773e1072948cfd47aa165874f75116348f")
    end
  end
end
