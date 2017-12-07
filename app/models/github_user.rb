class GithubUser

  attr_reader :name, :login, :picture, :followers, :following
  def initialize(attrs = {})
    @name       = attrs[:name]
    @login      = attrs[:login]
    @picture    = attrs[:avatar_url]
    @followers  = attrs[:followers]
    @following  = attrs[:following]
  end

  def self.profile_info(github_user)
    github_service = GithubService.new(github_user)
    github_user_info = github_service.api_profile_info
    GithubUser.new(github_user_info)
  end
end
