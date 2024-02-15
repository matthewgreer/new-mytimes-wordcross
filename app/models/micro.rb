class Micro < ApplicationRecord
  include PuzzleValidations

  has_many :user_micros
end
