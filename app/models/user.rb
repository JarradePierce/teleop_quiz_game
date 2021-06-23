require 'bcrypt'

class User < ApplicationRecord
  attr_accessor :password_hash
  has_secure_password

  validates :username, :email, :password, presence: true, :on => :create
  validates :username, :email, uniqueness: true
  
  has_many :games

  # users.password_hash in the database is a :string
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
