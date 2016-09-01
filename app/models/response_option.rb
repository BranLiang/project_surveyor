class ResponseOption < ApplicationRecord
  belongs_to :question

  has_many :join_options
  has_many :multi_responses, through: :join_options
  # accepts_nested_attributes_for :join_options,
  #                               :reject_if => :all_blank,
  #                               :allow_destroy => true;

end
