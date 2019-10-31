class AddPracticeDayToLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :logs, :practice_day, :date, null: false
  end
end
