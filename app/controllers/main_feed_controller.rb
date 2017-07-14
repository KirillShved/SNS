class MainFeedController < ApplicationController
  def show
    @photos = Photo.where(albums: { user: current_user.following }).includes(:taggings, :tags, album: :user)
                                                                   .order(created_at: :desc)
  end
end
