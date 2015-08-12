class AddImageToTask < ActiveRecord::Migration
  def change
    add_attachment :tasks, :image
  end
end
