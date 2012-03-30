class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.integer :x
      t.integer :y
      t.string :str

      t.timestamps
    end
  end
end
