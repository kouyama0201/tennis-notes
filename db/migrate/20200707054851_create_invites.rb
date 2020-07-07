class CreateInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :invites do |t|
      t.datetime :event_day
      t.string :title
      t.integer :prefecture_id
      t.string :address
      t.string :level
      t.integer :capacity
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
