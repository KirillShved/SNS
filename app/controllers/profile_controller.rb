class ProfileController < ApplicationController
  load_and_authorize_resource :user, parent: false

  def show
    @albums = @user.albums.includes(:photos)
  end

  private

  def user_params
    params.permit(:id)
  end
end
