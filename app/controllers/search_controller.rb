class SearchController < ApplicationController
  def search
    if params[:query].nil?
      @tags = []
    else
      @tags = Tag.search_by_text(params[:query]).first(5)
    end

    render json: @tags
  end
end
