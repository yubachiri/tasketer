class AddDefaultSegmentTitleType < ActiveRecord::Migration[5.2]
  def change
    change_column_default :segment_titles, :type, 'custom_title'
  end
end
