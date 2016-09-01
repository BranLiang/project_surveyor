class NumRange < ApplicationRecord
  belongs_to :survey

  validates_numericality_of :maximum, greater_than: :minimum
  validates_numericality_of :minimum, less_than: :maximum
  validates :text, presence: true

  def require_status
    self.required ? "Required" : "Not required"
  end

  def required?
    self.required
  end

  def input_range
    min = self.minimum
    max = self.maximum
    (min..max)
  end

end
