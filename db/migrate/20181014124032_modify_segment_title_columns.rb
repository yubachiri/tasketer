class ModifySegmentTitleColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :segment_titles, :seg_first, :string
    add_column :segment_titles, :seg_second, :string
    add_column :segment_titles, :seg_third, :string
    add_column :segment_titles, :seg_last, :string
    remove_column :segment_titles, :name
    remove_column :segment_titles, :segment
  end
end
