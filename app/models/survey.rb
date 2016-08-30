class Survey < ApplicationRecord
  has_many :questions
  has_many :num_ranges

  validates :title, length: { within: 1..100 },
                    presence: true
  validates :description, presence: true,
                          length: { within: 1..1000 }


  def has_no_questions_with_text?
    all_questions = self.questions
    if all_questions.empty?
      return true
    elsif all_questions.all?(&:has_no_text?)
      return true
    else
      return false
    end
  end

  def all_questions_with_text
    self.questions.select(&:has_text?)
  end
end
