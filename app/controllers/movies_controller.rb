class MoviesController < ApplicationController
  def index
    @movies = Movie.all  
    if params[:query].present?
      sql_query = <<~SQL
        movies.title @@ :query
        OR movies.synopsis @@ :query
        OR directors.first_name @@ :query
        OR directors.last_name @@ :query
      SQL

      @movies = @movies.joins(:director).where(sql_query, query: "%#{params[:query]}%")
    end
  end
end