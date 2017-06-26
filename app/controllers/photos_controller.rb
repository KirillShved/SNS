class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @photos = Photo.all
  end

  def create
    @photo = Photo.create(photo_params)
    @album = Album.find(params[:album_id])
    @album.photos << @photo

    respond_with @photo, location: [@album, @photo]
  end

  def show

  end

  def update
    @photo.update(photo_params)

    respond_with @photo
  end

  def destroy
    @photo.destroy

    respond_with @photo.album
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
    permitted_params = params.require(:photo).permit(:image, :description, tags: [])
    permitted_params[:tags] = TagService.new(permitted_params[:tags]).tags
    permitted_params
  end
end
