class Daily < ApplicationRecord
  include PuzzleValidations

  has_many :user_dailies
end
