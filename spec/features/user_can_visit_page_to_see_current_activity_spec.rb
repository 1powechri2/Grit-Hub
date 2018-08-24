require 'rails_helper'

describe 'A user visits root, logs in, clicks on recent activity' do
  it 'sees recent activity' do
    VCR.use_cassette("commits", :record => :all) do
      omniauth_stub
      stub_request(:get, "https://api.github.com/users/#{omniauth_stub.info.name}/events?access_token=#{omniauth_stub.credentials.token}").
        to_return(status: 200, body: File.open("./spec/fixtures/recent_activities.json"))

      visit root_path

      click_on 'Login'

      expect(current_path).to eq(dashboard_path)

      click_on 'Recent Activity'

      expect(current_path).to eq(activities_path)
      expect(page).to have_content('Chris Powell')
    end
  end
end
