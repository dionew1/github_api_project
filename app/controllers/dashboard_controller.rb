class DashboardController < ApplicationController
  def show
    @user = GithubUser.create_github_user(current_user)
  end
end
