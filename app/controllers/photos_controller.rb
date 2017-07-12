class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
    @album = Album.find(params[:album_id])
  end

  def create
    @album = Album.find(params[:album_id])
    @photo = @album.photos.create(photo_params)
    @photo.tags = TagService.new(params[:photo][:tags]).tags

    respond_with @photo.album
  end

  def show

  end

  def edit

  end

  def update
    @photo.tags = TagService.new(params[:photo][:tags]).tags
    @photo.update_attributes(photo_params)
    respond_with @photo.album
  end

  def destroy
    @photo.destroy
    respond_with @photo.album
  end

  private

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:image, :description)
  end
end
