class MoviesController < ApplicationController
  def index
    @movies = Movie.all  
    if params[:query].present?
      @movies = Movie.search_by_title_and_synopsis(params[:query])
    end
  end
end