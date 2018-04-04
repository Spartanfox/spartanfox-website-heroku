class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :creator
      t.text :message
      t.references :topic, foreign_key: true

      t.timestamps
    end
  end
end
