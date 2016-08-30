class Question < ApplicationRecord
  belongs_to :survey
  has_many :response_options, dependent: :destroy

  accepts_nested_attributes_for :response_options,
                                :reject_if => :all_blank,
                                :allow_destroy => true;

  validates :text, length: { within: 1..200 },
                   allow_nil: true

  validates :options, length: { within: 1..10 },
                      allow_nil: true

  def self.question_types
    [
      ["Multiple Choice", "multi"],
      ["Number Range", "num_range"]
    ]
  end

  def has_text?
    self.text ? true : false
  end

  def has_no_text?
    self.text ? false : true
  end

  def require_status
    self.required ? "Required" : "Not required"
  end

  def multi_select_status
    self.multi_select ? "Multiple select" : "Select one"
  end
end
