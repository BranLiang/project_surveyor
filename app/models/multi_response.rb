class MultiResponse < ApplicationRecord
  belongs_to :respondent, optional: true
  belongs_to :question

  serialize :answer

  validates :answer, presence: true, if: "Question.find_by_id(question_id).required?"

end
