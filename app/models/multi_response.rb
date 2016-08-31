class MultiResponse < ApplicationRecord
  belongs_to :respondent, optional: true
  belongs_to :question

end
