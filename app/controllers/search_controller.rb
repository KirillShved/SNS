class SearchController < ApplicationController
  def search
    result = SearchService.new(params[:query]).search
    respond_to do |format|
      format.json { render json: result }
    end
  end
end
