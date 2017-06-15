class Photo < ApplicationRecord
  mount_uploader :image, FileUploader
  validates :image, :description, presence: true

  belongs_to :album
end
