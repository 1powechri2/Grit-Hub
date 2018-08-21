class User < ApplicationRecord
  def self.create_with_omni_auth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["nickname"]
      user.token = auth["credentials"]["token"]
      user.pic = auth.extra.raw_info.avatar_url
    end
  end
end
