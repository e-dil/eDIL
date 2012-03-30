class PartOfSpeech < ActiveRecord::Base
  has_many :entries_part_of_speeches
  has_many :entries, through: :entries_part_of_speeches
end
