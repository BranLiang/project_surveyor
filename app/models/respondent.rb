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


end
