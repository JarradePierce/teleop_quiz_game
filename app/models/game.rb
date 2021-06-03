class Game < ApplicationRecord
  has_many :players
  has_many :questions
  belongs_to :user
end
