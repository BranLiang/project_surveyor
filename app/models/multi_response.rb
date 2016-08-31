class MultiResponse < ApplicationRecord
  belongs_to :respondent
  belongs_to :question
  belongs_to :response_option
end
