class EntriesPartOfSpeech < ActiveRecord::Base
  belongs_to :entry
  belongs_to :part_of_speech
end
