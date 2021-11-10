class Workspace < ApplicationRecord
  validates :name, uniqueness: true, presence: true
end
