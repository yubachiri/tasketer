class AddUserRefSegmentTitle < ActiveRecord::Migration[5.2]
  def change
    add_reference :segment_titles, :user, foreign_key: true
  end
end
