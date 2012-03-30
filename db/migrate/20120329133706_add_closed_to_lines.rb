class AddClosedToLines < ActiveRecord::Migration
  def change
    add_column :lines, :closed, :string

  end
end
