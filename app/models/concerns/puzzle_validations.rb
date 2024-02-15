module PuzzleValidations
  extend ActiveSupport::Concern

  included do
    validates :wordcross_date, presence: true, uniqueness: true
    validates :author, presence: true
    validates :solution, presence: true
    validates :clue_set, presence: true
    validates :label_set, presence: true
  end
end
