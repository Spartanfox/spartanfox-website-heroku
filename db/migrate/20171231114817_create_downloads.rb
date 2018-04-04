class CreateDownloads < ActiveRecord::Migration[5.1]
  def change
    create_table :downloads do |t|
      t.string :title, null: false, unique: true
      t.string :description
      t.string :creator
      t.string :download, null: false, unique: true
      t.integer :downloads_number, default: 0
      t.timestamps
    end
  end
end
