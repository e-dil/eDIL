class CreateBibls < ActiveRecord::Migration
  def change
    create_table :bibls do |t|
      t.string :str

      t.timestamps
    end

    create_table :references do |t|
      t.integer :entry_id
      t.integer :bibl_id
      t.string :loc
    end
  end
end
