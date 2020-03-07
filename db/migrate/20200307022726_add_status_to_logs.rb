class AddStatusToLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :logs, :status, :integer
  end
end
