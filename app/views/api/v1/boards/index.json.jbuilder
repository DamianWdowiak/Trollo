# frozen_string_literal: true

json.array! @boards, partial: 'api/v1/boards/board_min', as: :board
