class RangeResponse < ApplicationRecord
  belongs_to :respondent, optional: true
  belongs_to :num_range

  validates :answer, presence: true, if: "NumRange.find_by_id(num_range_id).required?"
  
end
