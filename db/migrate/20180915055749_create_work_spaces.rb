class CreateWorkSpaces < ActiveRecord::Migration[5.2]
  def change
    create_table :work_spaces do |t|
      t.string :name, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
