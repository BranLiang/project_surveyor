class ResponseOption < ApplicationRecord
  belongs_to :question

  has_many :join_options
  has_many :multi_responses, through: :join_options, class_name: "MultiResponse"
  
end
