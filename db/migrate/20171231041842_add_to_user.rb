class AddToUser < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :username, :string, unique: true, default: nil,null: false
    change_column :users, :email, :string, unique: true, default: nil
  end
end
