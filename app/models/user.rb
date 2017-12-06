class User < ApplicationRecord
  def self.from_omniauth(auth_info)
    user = self.find_or_create_by(uid: auth_info[:uid]) do |user|
      user.uid      = auth_info.uid
      user.login    = auth_info.extra.raw_info.login
      user.token    = auth_info.credentials.token
    end
    verify_current_token(user, auth_info)
  end

  def self.verify_current_token(user, auth_info)
    unless user.token == auth_info.credentials.token
      user.update(token: auth_info.credentials.token)
    end
    user
  end
end
