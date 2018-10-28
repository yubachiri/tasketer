class CreateDefaultSegmentTitles < ActiveRecord::Migration[5.2]
  def change
    create_table :default_segment_titles do |t|
      t.string :seg_first
      t.string :seg_second
      t.string :seg_third
      t.string :seg_last

      t.timestamps
    end
  end
end
