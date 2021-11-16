# frozen_string_literal: true

json.array! @lists, partial: 'api/v1/lists/list', as: :list
