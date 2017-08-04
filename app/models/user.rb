# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string           default(""), not null
#  avatar                 :string
#  last_name              :string           default(""), not null
#  address                :string           default(""), not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  include PgSearch
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true
  mount_uploader :avatar, AvatarUploader

  has_many :comments, dependent: :destroy
  has_many :albums, dependent: :destroy
  has_many :active_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  pg_search_scope :search_by_full_name, against: [:first_name, :last_name], using: { tsearch: { prefix: true } }

  # helper methods

  # follow another user

  def follow(other)
    active_relationships.create(followed_id: other.id)
  end

  # unfollow a user

  def unfollow(other)
    active_relationships.find_by(followed_id: other.id).destroy
  end

  # is following a user?

  def following?(other)
    following.include?(other)
  end
end
