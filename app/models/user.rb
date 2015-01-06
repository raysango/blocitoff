class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable
  mount_uploader :avatar, AvatarUploader
  
  has_one :list
end
