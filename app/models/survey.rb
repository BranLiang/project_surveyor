class Survey < ApplicationRecord
  has_many :survey_questions
  has_many :questions, :through => :survey_questions

  validates :title, length: { within: 1..100 },
                    presence: true
  validates :description, presence: true,
                          length: { within: 1..1000 }
end
