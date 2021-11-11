class Workspace < ApplicationRecord
  has_many :boards, dependent: :destroy

  validates :name, uniqueness: true, presence: true
end
