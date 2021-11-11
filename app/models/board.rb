# frozen_string_literal: true

class Board < ApplicationRecord
  enum visibility: { workspace: 0, private: 1, public: 2 }, _prefix: true

  belongs_to :owner, class_name: :User, foreign_key: 'user_id'
  belongs_to :workspace

  has_many :board_members, dependent: :destroy
  has_many :members, through: :board_members

  validates :name, presence: true
end
