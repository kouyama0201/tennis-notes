class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.integer :serve
      t.integer :smash
      t.integer :volley
      t.integer :stroke
      t.integer :game
      t.text :text
      t.string :image
      t.timestamps
    end
  end
end
