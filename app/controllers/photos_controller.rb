class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  def index
    @photo = Photo.all
  end

  def create
    @photo = Photo.create(photo_params)
    @album = Album.find(params[:album_id])
    @album.photos << @photo

    respond_to do |format|
      if @photo.save
        format.html { redirect_to [ @album, @photo ], notice: 'Photo was successfully created.' }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def show

  end

  def new
    @photo = Photo.new

  end

  private
  def set_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:title, :image, :description)
  end
end
