class ProfileController < ApplicationController
  def index
    @user = User.find(params[:id])
    @albums = @user.albums
    @photos = Photo.where('albums.user_id' => current_user.id).includes(:album).count
  end
end
