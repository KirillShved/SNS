# == Schema Information
#
# Table name: photos
#
#  id          :integer          not null, primary key
#  image       :string
#  description :text
#  album_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_photos_on_album_id  (album_id)
#

class Photo < ApplicationRecord
  mount_uploader :image, FileUploader
  validates :image, :description, presence: true

  belongs_to :album

  has_many :comments
  has_many :taggings, as: :taggable, dependent: :destroy
  has_many :tags, through: :taggings
end
