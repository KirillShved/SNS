class MainFeedController < ApplicationController
  def index
    @photos = Photo.where('albums.user_id' => current_user.id).includes(:album)
  end
end
