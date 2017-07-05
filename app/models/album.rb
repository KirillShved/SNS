# == Schema Information
#
# Table name: albums
#
#  id          :integer          not null, primary key
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#  image_url   :string
#  user_id     :integer
#
# Indexes
#
#  index_albums_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Album < ApplicationRecord
  validates :title, :description, presence: true
  has_many :photos

  belongs_to :user

  has_many :taggings, as: :taggable, dependent: :destroy
  has_many :tags, through: :taggings
end
