class Entry < ActiveRecord::Base
  has_many :entries_part_of_speeches
  has_many :part_of_speeches, through: :entries_part_of_speeches
  has_many :references
  has_many :bibls, through: :references
  has_many :definitions
end
