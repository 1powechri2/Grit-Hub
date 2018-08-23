require 'rails_helper'

describe 'A user visits root, logs in, clicks on recent activity' do
  it 'sees recent activity' do
    omniauth_stub

    visit root_path

    click_on 'Login'

    expect(current_path).to eq(dashboard_path)
  end
end
