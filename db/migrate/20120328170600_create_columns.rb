class CreateColumns < ActiveRecord::Migration
  def change
    create_table :columns do |t|
      t.integer :letter_id
      t.integer :number

      t.timestamps
    end
  end
end
