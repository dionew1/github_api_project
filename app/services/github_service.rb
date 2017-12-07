class GithubService

  def initialize(github_user)
    @github_user = github_user
    @conn = Faraday.new(url: "https://api.github.com") do |f|
      f.adapter Faraday.default_adapter
      f.params[:access_token] = github_user.token
    end
  end

  def api_profile_info
    get_json("/users/#{github_user.login}")
  end

  private
    attr_reader :conn, :github_user

    def get_json(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end
end
