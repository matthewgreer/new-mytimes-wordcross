class ChangeDailiesAndMicrosSolutionsAndLabelsToArrays < ActiveRecord::Migration[7.1]
  def change
    remove_column :dailies, :solution
    remove_column :dailies, :label_set
    remove_column :micros, :solution
    remove_column :micros, :label_set


    add_column :dailies, :solution, :string, array: true, null: false
    add_column :dailies, :label_set, :string, array: true, null: false

    add_column :micros, :solution, :string, array: true, null: false
    add_column :micros, :label_set, :string, array: true, null: false
  end
end
