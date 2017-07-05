class AlbumsController < ApplicationController
  before_action :set_album, only: [:update, :destroy]
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

  def create
    @album = @user.albums.create(album_params)
    @album.tags = TagService.new(params[:album][:tags]).tags

    respond_with @album
  end

  def update
    @album.update(album_params)

    respond_with @album
  end

  def destroy
    @album.destroy

    redirect_to profile_index_path
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
