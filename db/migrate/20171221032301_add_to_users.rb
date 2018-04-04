class AddToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string, :default => "Person"
    add_column :users, :authorisation, :integer, :default => 0
  end
end
