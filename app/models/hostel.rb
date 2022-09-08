class Hostel < ApplicationRecord
  belongs_to :user
  has_many :rooms, dependent: :destroy
  has_many_attached :images
end
