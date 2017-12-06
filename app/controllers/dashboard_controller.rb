class DashboardController < ApplicationController

  def show
    response = Faraday.get("https://api.github.com/users/#{current_user.login}")
    user_info = JSON.parse(response.body, symbolize_names: true)
    binding.pry
  end

end
