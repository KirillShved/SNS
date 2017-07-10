class AlbumsController < ApplicationController
  before_action :set_album, only: [:edit, :update, :destroy]
  before_action :set_user, only: [:new, :create]
  respond_to :html

  def index
    @albums = Album.all
  end

  def show
    @album = Album.includes(photos: :tags).find(params[:id])
  end

  def new
    @album = Album.new
  end

  def edit

  end

  def create
    @album = @user.albums.create(album_params)
    @album.tags = TagService.new(params[:album][:tags]).tags
    respond_with @album
  end

  def update
    @album.tags = TagService.new(params[:album][:tags]).tags
    @album.update(album_params)
    respond_with @album
  end

  def destroy
    @album.destroy

    redirect_to profile_path(current_user)
  end

  private

  def set_album
    @album = Album.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def album_params
    params.require(:album).permit(:title, :description)
  end
end
