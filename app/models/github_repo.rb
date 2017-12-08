class GithubRepo

  attr_reader :name, :current_user

  def initialize(name, current_user)
    @name = name
    @current_user = current_user
  end

  def commits
    GithubService.new(current_user).api_user_commits(name)
  end
end
