# frozen_string_literal: true

class BoardMember < ApplicationRecord
  belongs_to :member, class_name: :User, foreign_key: "user_id"
  belongs_to :board
end
