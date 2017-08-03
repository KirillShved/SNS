class PhotosController < ApplicationController
  respond_to :html
  load_and_authorize_resource :user
  load_and_authorize_resource :album, through: :user, shallow: true
  load_and_authorize_resource through: :album, shallow: true

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo.tags = TagService.new(params[:photo][:tags]).tags if @photo.save
    respond_with @photo.album
  end

  def show
    @comments = @photo.comments.includes(:user).order(created_at: :asc)
    @comment = Comment.new(user: current_user)
    render action: 'show', layout: false if request.xhr?
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

  def photo_params
    params.require(:photo).permit(:image, :description)
  end
end
