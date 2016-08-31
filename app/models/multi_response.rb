class MultiResponse < ApplicationRecord
  belongs_to :respondent
  belongs_to :question
  has_many :join_options
  has_many :response_options, :through => :join_options
end
