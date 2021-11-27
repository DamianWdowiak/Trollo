# frozen_string_literal: true

json.partial! @board

json.lists do
  json.array! @board.lists.order(:position), partial: 'api/v1/lists/list', as: :list
end
