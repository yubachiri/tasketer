class CreateSegmentTitles < ActiveRecord::Migration[5.2]
  def change
    create_table :segment_titles do |t|
      t.string :name, null: false
      t.integer :type, null: false
      t.references :work_spaces, foreign_key: true

      t.timestamps
    end
  end
end
