class Photo < ActiveRecord::Base

  belongs_to :album
  belongs_to :user

  
  mount_uploader :file, AvatarUploader
end
