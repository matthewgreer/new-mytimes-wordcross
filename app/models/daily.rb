class Daily < ApplicationController
  include PuzzleValidations
  
  has_many :user_dailies
end
