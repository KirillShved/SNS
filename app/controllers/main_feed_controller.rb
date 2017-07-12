class MainFeedController < ApplicationController

  def index
    @photos = Photo.where(albums: { user: current_user.following }).includes(:taggings, :tags, album: :user)
                                                                   .order(created_at: :desc)
  end
end
