class RenameGoalsTable < ActiveRecord::Migration[5.1]
  def change
    rename_table :comments, :goal_comments
  end
end
