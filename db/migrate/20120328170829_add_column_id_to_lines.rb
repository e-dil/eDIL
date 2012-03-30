class AddColumnIdToLines < ActiveRecord::Migration
  def change
    add_column :lines, :column_id, :integer

  end
end
