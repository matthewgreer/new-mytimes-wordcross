class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :session_token
      t.string :password_digest
      t.string :timezone
      t.integer :streak

      t.timestamps
    end
  end
end
