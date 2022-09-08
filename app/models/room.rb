class Room < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  index_name :room
  document_type self.name.downcase

  belongs_to :hostel
end