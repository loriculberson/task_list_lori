class ChangeTaskCompletedToStatus < ActiveRecord::Migration
  def change
    rename_column :tasks, :completed, :status

  end
end
