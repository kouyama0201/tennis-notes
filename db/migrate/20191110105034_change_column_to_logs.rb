class ChangeColumnToLogs < ActiveRecord::Migration[5.2]

  def up
    change_column :logs, :serve, :integer, default: 0
    change_column :logs, :smash, :integer, default: 0
    change_column :logs, :volley, :integer, default: 0
    change_column :logs, :stroke, :integer, default: 0
    change_column :logs, :game, :integer, default: 0
    change_column :logs, :likes_count, :integer, default: 0
  end

  def down
    change_column :logs, :serve, :integer
    change_column :logs, :smash, :integer
    change_column :logs, :volley, :integer
    change_column :logs, :stroke, :integer
    change_column :logs, :game, :integer
    change_column :logs, :likes_count, :integer
  end
end
