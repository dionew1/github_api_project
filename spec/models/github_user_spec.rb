require 'rails_helper'

describe GithubUser do
  context "initialize" do
    it "exists with valid data" do
      attrs = {
        name:      "Dione",
        login:     "dionew1",
        avatar_url:   "https://avatars1.githubusercontent.com/u/22304676?v=4",
        followers: "5",
        following: "7"
      }

      github_user = GithubUser.new attrs
      expect(github_user).to be_a GithubUser
      expect(github_user.name).to eq "Dione"
      expect(github_user.login).to eq "dionew1"
      expect(github_user.picture).to eq "https://avatars1.githubusercontent.com/u/22304676?v=4"
      expect(github_user.followers).to eq "5"
      expect(github_user.following).to eq "7"
    end
  end
end
