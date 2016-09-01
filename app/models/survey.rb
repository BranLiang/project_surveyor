class Survey < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :num_ranges, dependent: :destroy
  has_many :respondents, dependent: :destroy

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

  def choose_num(option)
    count = 0
    if self.has_respondents?
      self.respondents.each do |respondent|
        count += 1 if respondent.choosed?(option)
      end
    end
    count
  end

  def has_respondents?
    self.respondents.empty? ? false : true
  end

  def all_range_values(num_range)
    results = Hash.new{0}
    self.respondents.each do |respondent|
      results[respondent.number_picked(num_range)] += 1 if respondent.number_picked(num_range)
    end
    results
  end
end
