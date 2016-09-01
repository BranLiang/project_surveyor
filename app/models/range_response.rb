class RangeResponse < ApplicationRecord
  belongs_to :respondent, optional: true
  belongs_to :num_range
end
