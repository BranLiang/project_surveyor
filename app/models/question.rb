class Question < ApplicationRecord
  belongs_to :survey
  has_many :response_options

  accepts_nested_attributes_for :response_options,
                                :reject_if => :all_blank,
                                :allow_destroy => true;

  validates :text, length: { within: 1..200 },
                   allow_nil: true

  validates :options, length: { within: 1..10 },
                      allow_nil: true

  def self.question_types
    [
      ["Multiple Choice", "multi"]
    ]
  end
end
