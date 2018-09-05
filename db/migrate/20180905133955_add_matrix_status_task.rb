class AddMatrixStatusTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :matrix_status, :integer
    add_column :tasks, :type, :string
    add_index :tasks, :type
  end
end
