class User < ApplicationRecord
  has_secure_password
  has_many :games

  validates_presence_of :username, :email

end
