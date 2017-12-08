class GithubUser

  attr_reader :name, :login, :picture, :followers, :num_of_followers,
              :num_of_following, :orgs, :starred, :repos

  def initialize(profile_info, followers, orgs, starred, repos)
    @name             = profile_info[:name]
    @login            = profile_info[:login]
    @picture          = profile_info[:avatar_url]
    @num_of_followers = profile_info[:followers]
    @num_of_following = profile_info[:following]
    @followers        = followers
    @orgs             = orgs
    @starred          = starred
    @repos            = repos
  end

  def self.create_github_user(current_user)
    service=GithubService.new(current_user)
    profile_info=service.api_profile_info
    followers=service.api_user_followers
    orgs=service.api_user_orgs.map {|org| org[:login]}
    starred=service.api_users_starred.map {|starred_repo| starred_repo[:name]}
    repos=service.api_user_repos.map {|repo| GithubRepo.new(repo[:name], current_user)}
    GithubUser.new(profile_info, followers, orgs, starred, repos)
  end
end
