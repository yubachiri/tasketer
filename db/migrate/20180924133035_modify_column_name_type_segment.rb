class ModifyColumnNameTypeSegment < ActiveRecord::Migration[5.2]
  def change
    rename_column :segment_titles, :type, :segment
  end
end
