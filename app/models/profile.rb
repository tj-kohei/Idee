class Profile < ApplicationRecord
  belongs_to :user
  mount_uploader :avatar, AvatarUploader

  def nickname_to_username
    if nickname.blank?
      "@" + user.nickname_to_username
    else
      nickname
    end
end

def usernmame?
  if nickname.present?
    "@" + user.usernmame
  else

  end
end

end