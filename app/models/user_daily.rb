class UserDaily < ApplicationRecord
  validates :user_id, presence: true

  belongs_to :user
  belongs_to :daily
end
