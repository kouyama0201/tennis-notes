class AddNumcountToLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :logs, :likes_count, :integer
  end
end
