class MainFeedController < ApplicationController

  def index
    @photos = Photo.where(albums: { user: current_user.following }).includes(:album)
                                                                   .order(created_at: :desc)
  end
end
