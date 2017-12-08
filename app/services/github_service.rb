class GithubService

  def initialize(current_user)
    @current_user = current_user
    @conn = Faraday.new(url: "https://api.github.com") do |f|
      f.adapter Faraday.default_adapter
      f.params[:access_token] = current_user.token
    end
  end

  def api_profile_info
    get_json("/users/#{current_user.login}")
  end

  def api_user_followers
    get_json("/users/#{current_user.login}/followers")
  end

  def api_users_starred
    get_json("/users/#{current_user.login}/starred")
  end

  def api_user_orgs
    get_json("/user/orgs")
  end

  def api_user_repos
    get_json("/users/#{current_user.login}/repos")
  end

  def api_user_commits(repo)
    get_json("/repos/#{current_user.login}/#{repo}/commits")
  end

  private
    attr_reader :conn, :current_user

    def get_json(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end
end
