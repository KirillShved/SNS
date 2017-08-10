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
  include PgSearch

  validates :text, uniqueness: true, format: { with: /\A#[\da-zA-Zа-яА-ЯёЁ]{1,20}\z/, message: 'wrong tag format' }

  pg_search_scope :search_by_text, against: :text, using: { tsearch: { prefix: true} }

  has_many :taggings
  has_many :albums, through: :taggings, source: :taggable, source_type: 'Album'
  has_many :photos, through: :taggings, source: :taggable, source_type: 'Photo'
end
