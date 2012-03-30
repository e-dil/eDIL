class CreatePartOfSpeeches < ActiveRecord::Migration
  def change
    create_table :part_of_speeches do |t|
      t.string :name

      t.timestamps
    end

    create_table :entries_part_of_speeches do |t|
      t.integer :entry_id
      t.integer :part_of_speech_id
    end
  end
end
