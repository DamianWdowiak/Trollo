# frozen_string_literal: true

json.extract! file, :id, :filename, :content_type, :byte_size

json.url rails_blob_path(file, disposition: 'attachment')
