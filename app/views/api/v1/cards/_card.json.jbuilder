# frozen_string_literal: true

json.extract! card, :id, :title, :description, :position

json.files do
  json.array! card.files, partial: 'api/v1/files/file', as: :file
end
