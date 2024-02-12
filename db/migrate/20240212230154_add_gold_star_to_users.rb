class AddGoldStarToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :last_gold_star_date, :string
  end
end
