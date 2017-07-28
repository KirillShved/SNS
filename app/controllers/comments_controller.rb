class CommentsController < ApplicationController
  respond_to :html
  load_and_authorize_resource :user
  load_and_authorize_resource :album, through: :user, shallow: true
  load_and_authorize_resource :photo, through: :album, shallow: true
  load_and_authorize_resource through: :photo, shallow: true

  def new
    @comment = Comment.new
  end

  def create
    @comment.user = current_user
    @comment.save(comment_params)
    redirect_to @photo
  end

  def destroy
    @comment.destroy
  end

  private

  def comment_params
    permitted_params = params.require(:comment).permit(:text)
  end
end
