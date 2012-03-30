class Reference < ActiveRecord::Base
  belongs_to :entry
  belongs_to :bibl
end
