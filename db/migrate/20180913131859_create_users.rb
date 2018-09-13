class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :firstName
      t.string :lastName
      t.string :email
      t.string :password
      t.string :interest
      t.string :password_digest

      t.timestamps
    end
  end
end
