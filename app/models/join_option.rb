class JoinOption < ApplicationRecord
  belongs_to :multi_response
  belongs_to :response_option
end
