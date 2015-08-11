class RemoveStatusAndChangeToString < ActiveRecord::Migration
  def change
    remove_column :tasks, :status
    add_column :tasks, :status,  :string
  end
end
