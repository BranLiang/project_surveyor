class Question < ApplicationRecord
  has_many :survey_questions
  has_many :surveys, :through => :survey_questions

  has_many :response_options

  accepts_nested_attributes_for :response_options,
                                :reject_if => :all_blank,
                                :allow_destroy => true;


  validates :text, length: { within: 1..200 }

  def self.question_types
    [
      ["Multiple Choice", "multi"]
    ]
  end
end
