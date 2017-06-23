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

require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
