class Album < ApplicationRecord
  validates :title, :description, presence: true
  has_many :photos
end
