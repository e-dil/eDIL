class AddOrthToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :orth, :string

  end
end
