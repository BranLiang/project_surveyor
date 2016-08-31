class Respondent < ApplicationRecord
  has_many :multi_responses
  has_many :range_responses

  accepts_nested_attributes_for :range_responses,
                                :reject_if => :all_blank,
                                :allow_destroy => true;

  accepts_nested_attributes_for :multi_responses,
                                :reject_if => :all_blank,
                                :allow_destroy => true;
end
