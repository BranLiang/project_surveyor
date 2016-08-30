class NumRange < ApplicationRecord
  belongs_to :survey

  validates_numericality_of :maximum, greater_than: :minimum
  validates_numericality_of :minimum, less_than: :maximum
  validates :text, :required, presence: true
end
