class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @albums = Album.all
  end

  def show

  end

  def new
    @album = Album.new
  end

  def edit
  end

  def create
    @album = Album.create(album_params)
    current_user.albums << @album

    respond_with @album
  end

  def update
    @album.update(album_params)

    respond_with @album
  end

  def destroy
    respond_with @album.destroy
  end

  private

  def set_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:title, :description, :image_url)
  end
end
