class AddGoldStarAndValidationsToUsers < ActiveRecord::Migration[7.1]
  def change
    change_column_null :users, :email, false
    change_column_null :users, :session_token, false
    change_column_null :users, :password_digest, false
    change_column_default :users, :streak, to: 0
  end
end
