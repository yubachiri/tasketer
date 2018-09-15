class ModifyTaskForWorkspace < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :work_space, foreign_key: true
    remove_reference :tasks, :user, index: true
  end
end
