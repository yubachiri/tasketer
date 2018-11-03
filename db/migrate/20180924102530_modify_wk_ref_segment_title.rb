class ModifyWkRefSegmentTitle < ActiveRecord::Migration[5.2]
  def change
    remove_reference :segment_titles, :work_spaces, index: true
    add_reference :segment_titles, :work_space, foreign_key: true
  end
end
