class ProfileController < ApplicationController
  def index
    @albums = current_user.albums
    @photos = Photo.where('albums.user_id' => current_user.id).includes(:album).count
  end
end
