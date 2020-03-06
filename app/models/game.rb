class Game < ApplicationRecord
  has_many :players
  has_many :questions
  has_many :answers
end
