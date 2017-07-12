class ProfileController < ApplicationController
  def index
    @user = User.find(params[:id])
    @albums = @user.albums.includes(:photos)
  end
end
