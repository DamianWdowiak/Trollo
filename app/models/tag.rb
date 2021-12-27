class Tag < ApplicationRecord
  belongs_to :board
  belongs_to :card

  validates :name, presence: true
  validates :color, presence: true

  enum color: { white: 0, green: 1, blue: 2, red: 3, orange: 4, violet: 5, yellow: 6, grey: 7, black: 8}, _prefix: true
end
