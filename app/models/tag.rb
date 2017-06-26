# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  text       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ApplicationRecord
  validates :text, uniqueness: true, format: { with: /\A#[\da-zA-Zа-яА-ЯёЁ]{1,20}\z/,
                                               message: 'wrong tag format' }

  has_many :taggings
  has_many :albums, through: :taggings, source: :taggable, source_type: 'Album'
  has_many :photos, through: :taggings, source: :taggable, source_type: 'Photo'
end
