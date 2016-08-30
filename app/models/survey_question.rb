class SurveyQuestion < ApplicationRecord
  belongs_to :survey
  belongs_to :question

  validates :survey_id, uniqueness: { :scope => :question_id }
end
