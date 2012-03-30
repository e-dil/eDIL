class CreateDefinitions < ActiveRecord::Migration
  def change
    create_table :definitions do |t|
      t.string :name
      t.integer :entry_id

      t.timestamps
    end
  end
end
