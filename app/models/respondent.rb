class Respondent < ApplicationRecord
  has_many :multi_responses, dependent: :destroy
  has_many :range_responses, dependent: :destroy
  belongs_to :survey

  accepts_nested_attributes_for :range_responses,
                                :reject_if => :all_blank,
                                :allow_destroy => true;

  accepts_nested_attributes_for :multi_responses,
                                :reject_if => :all_blank,
                                :allow_destroy => true;


  def choosed?(option)
    if self.has_multi_responses?
      self.multi_responses.any? do |multi_response|
        multi_response.option_choosed?(option)
      end
    end
  end

  def has_multi_responses?
    self.multi_responses.empty? ? false : true
  end

  def number_picked(num_range)
    self.range_responses.each do |range_response|
      return range_response.answer if range_response.num_range_id == num_range.id
    end
  end

end
