class MultiResponse < ApplicationRecord
  belongs_to :respondent, optional: true
  belongs_to :question

  has_many :join_options
  has_many :response_options, through: :join_options, class_name: "ResponseOption"

  # serialize :answer

  # validates :answer, presence: true, if: "Question.find_by_id(question_id).required?"

end
