class Survey < ApplicationRecord
  has_many :questions

  validates :title, length: { within: 1..100 },
                    presence: true
  validates :description, presence: true,
                          length: { within: 1..1000 }


  def has_no_questions_with_text?
    if self.questions.empty?
      return true
    elsif self.questions.all?(&:has_no_text?)
      return true
    else
      return false
    end
  end

  def all_questions_with_text
    self.questions.select(&:has_text?)
  end
end
