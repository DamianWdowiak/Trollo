# frozen_string_literal: true

json.partial! 'api/v1/boards/board_min', board: board

json.owner do
  json.partial! 'api/v1/users/user', user: board.owner
end

json.members do
  json.array! board.members, partial: 'api/v1/users/user', as: :user
end
