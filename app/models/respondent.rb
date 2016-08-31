class Respondent < ApplicationRecord
  serialize :answer
  has_many :multi_responses
  has_many :range_responses
  belongs_to :survey

  accepts_nested_attributes_for :range_responses,
                                :reject_if => :all_blank,
                                :allow_destroy => true;

  accepts_nested_attributes_for :multi_responses,
                                :reject_if => :all_blank,
                                :allow_destroy => true;


end
