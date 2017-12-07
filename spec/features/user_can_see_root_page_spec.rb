require 'rails_helper'

describe "user can visit root page" do
  it "to login via github" do
    visit "/"

    expect(page).to have_content("Sign in with GitHub")
  end
end
