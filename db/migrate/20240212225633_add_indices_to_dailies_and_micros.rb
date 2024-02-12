class AddIndicesToDailiesAndMicros < ActiveRecord::Migration[7.1]
  def change
    add_index :dailies, :id
    add_index :dailies, :wordcross_date

    add_index :micros, :id
    add_index :micros, :wordcross_date

    add_index :user_dailies, :wordcross_date

    add_index :user_micros, :wordcross_date

    change_column_default :users, :streak, 0
  end
end
