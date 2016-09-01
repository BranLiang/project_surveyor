class MultiResponse < ApplicationRecord
  belongs_to :respondent, optional: true
  belongs_to :question
  # belongs_to :response_option, :foreign_key => :answer

  has_many :join_options
  has_many :response_options, through: :join_options

  accepts_nested_attributes_for :response_options,
                                :reject_if => :all_blank,
                                :allow_destroy => true


  # serialize :answer

  # validates :answer, presence: true, if: "Question.find_by_id(question_id).required?"

end
