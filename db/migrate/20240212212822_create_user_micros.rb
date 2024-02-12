class CreateUserMicros < ActiveRecord::Migration[7.1]
  def change
    create_table :user_micros do |t|
      t.string :solving_state, array: true
      t.boolean :solved, default: false, null: false
      t.datetime :wordcross_date, null: false
      t.string :timer, null: false, array: true
      t.integer :icon
      t.belongs_to :user
      t.belongs_to :micro
      t.timestamps
    end
  end
end
