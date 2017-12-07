require 'rails_helper'

describe "User can view basic info" do

  before do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
       "provider"=>"github",
       "uid"=>"22304676",
       "info"=>
        {"nickname"=>"dionew1",
         "email"=>"dionew1@gmail.com",
         "name"=>"Dione",
         "image"=>"https://avatars1.githubusercontent.com/u/22304676?v=4",
         "urls"=>{"GitHub"=>"https://github.com/dionew1", "Blog"=>""}},
       "credentials"=>
        {"token"=>"5013e0b5b2c6882e74db849b70470581fc5504c8", "expires"=>false},
       "extra"=>
        {"raw_info"=>
          {"login"=>"dionew1"}}})
    end

  it "on dashboard show" do
    VCR.use_cassette("login_and_dashboard_basic_info") do
      visit "/"
      click_on "Sign in with GitHub"
      visit "/dashboard"
    end

    expect(page).to have_selector ".profile_pic"
    expect(page).to have_selector ".name"
    expect(page).to have_selector ".starred"
    expect(page).to have_selector ".followers"
    expect(page).to have_selector ".following"
  end
end
