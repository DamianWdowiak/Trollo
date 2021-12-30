# frozen_string_literal: true

json.extract! card, :id, :title, :description, :position

json.files do
  json.array! card.files, partial: 'api/v1/files/file', as: :file
end

json.comments do
  json.array! card.comments.order("created_at DESC"), partial: 'api/v1/comments/comment', as: :comment
end

json.tags do
  json.array! card.tags, partial: 'api/v1/tags/tag', as: :tag
end
