class CreateDailies < ActiveRecord::Migration[7.1]
  def change
    create_table :dailies do |t|
      t.datetime :wordcross_date
      t.string :author
      t.string :solution
      t.string :label_set
      t.jsonb :clue_set

      t.timestamps
    end
  end
end
