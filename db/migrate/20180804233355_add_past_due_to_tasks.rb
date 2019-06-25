class AddPastDueToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :past_due, :boolean
  end
end
