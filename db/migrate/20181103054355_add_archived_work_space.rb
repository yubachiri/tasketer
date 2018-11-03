class AddArchivedWorkSpace < ActiveRecord::Migration[5.2]
  def change
    add_column :work_spaces, :archived, :boolean, default: false
  end
end
