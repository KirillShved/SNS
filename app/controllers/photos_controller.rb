class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @photo = Photo.all
  end

  def create
    @photo = Photo.create(photo_params)
    @album = Album.find(params[:album_id])
    @album.photos << @photo

    respond_with @photo, location: [@album, @photo]
  end

  def show

  end

  def new
    @photo = Photo.new
    @album = Album.find(params[:album_id])
  end

  private

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:title, :image, :description)
  end
end
