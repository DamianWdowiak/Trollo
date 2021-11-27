# frozen_string_literal: true

json.extract! list, :id, :name, :position

json.cards do
  json.array! list.cards.order(:position), partial: 'api/v1/cards/card', as: :card
end
