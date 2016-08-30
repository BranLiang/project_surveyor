class Survey < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :num_ranges, dependent: :destroy

  validates :title, length: { within: 1..100 },
                    presence: true
  validates :description, presence: true,
                          length: { within: 1..1000 }


  def has_no_multi_questions_with_text?
    all_questions = self.questions
    if all_questions.empty?
      return true
    elsif all_questions.all?(&:has_no_text?)
      return true
    else
      return false
    end
  end

  def has_multi_questions?
    !has_no_multi_questions_with_text?
  end

  def has_num_ranges?
    !has_no_num_ranges?
  end

  def has_no_num_ranges?
    self.num_ranges.empty? ? true : false
  end

  def has_no_questions?
    has_no_multi_questions_with_text? &&
    has_no_num_ranges?
  end

  def has_questions?
    !has_no_questions?
  end

  def all_multi_questions_with_text
    self.questions.where.not(text: nil)
  end

  def all_num_questions
    self.num_ranges
  end
end
