class List < ApplicationRecord
  belongs_to :board

  validates :name, presence: true
  validates :position, numericality: { greater_than_or_equal_to: 0 }
end
