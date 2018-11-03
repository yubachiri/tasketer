class AddTypeSegmentTitle < ActiveRecord::Migration[5.2]
  def change
    add_column :segment_titles, :type, :string
  end
end
