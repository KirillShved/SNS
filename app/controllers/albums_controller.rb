class AlbumsController < ApplicationController
  respond_to :html
  load_and_authorize_resource :user
  load_and_authorize_resource through: :user, shallow: true

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
    @album.tags = TagService.new(params[:album][:tags]).tags if @album.save
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

  def album_params
    params.require(:album).permit(:title, :description)
  end
end
