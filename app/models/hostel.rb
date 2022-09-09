class Hostel < ApplicationRecord
  #include Elasticsearch::Model
  #include Elasticsearch::Model::Callbacks

  #index_name :hostel
  #document_type self.name.downcase

  belongs_to :user
  has_many :rooms, dependent: :destroy
  has_many_attached :images


end
