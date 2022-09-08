class Hostel < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :rooms
  has_many_attached :images
end
