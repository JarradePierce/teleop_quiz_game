class Question < ApplicationRecord
  belongs_to :answer
  belongs_to :game
end
