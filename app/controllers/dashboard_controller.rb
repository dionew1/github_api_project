class DashboardController < ApplicationController

  def show
    @user = GithubUser.profile_info(current_user)
  end

end
