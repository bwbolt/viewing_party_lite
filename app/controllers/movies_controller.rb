class MoviesController < ApplicationController
  def discover; end

  def index
    if params[:q] == 'top20rated'

      @movies = MovieFacade.create_top_movies

    else
      @movies = MovieFacade.create_movie_search(params[:q])
      @search = params[:q]
    end
  end

  def show
    @movie = MovieFacade.create_movie_details(params[:id])
  end
end
