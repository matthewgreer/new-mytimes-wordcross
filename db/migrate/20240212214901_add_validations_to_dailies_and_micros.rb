class AddValidationsToDailiesAndMicros < ActiveRecord::Migration[7.1]
  def change
    change_column_null :dailies, :wordcross_date, false
    change_column_null :dailies, :author, false
    change_column_null :dailies, :solution, false
    change_column_null :dailies, :label_set, false
    change_column_null :dailies, :clue_set, false

    change_column_null :micros, :wordcross_date, false
    change_column_null :micros, :author, false
    change_column_null :micros, :solution, false
    change_column_null :micros, :label_set, false
    change_column_null :micros, :clue_set, false
  end
end
