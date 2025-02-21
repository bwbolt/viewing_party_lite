class MovieFacade
  def self.create_top_movies
    json = MovieService.get_top_movies

    movies = json[:results].first(40).map do |info|
      Movie.new(info)
    end
  end

  def self.create_movie_search(string)
    json = MovieService.get_movie_search(string)

    movies = json[:results].first(40).map do |info|
      Movie.new(info)
    end
  end

  def self.create_movie_details(id)
    details = MovieService.get_movie_details(id)
    credits = MovieService.get_movie_credits(id)
    reviews = MovieService.get_movie_reviews(id)
    movie = Movie.new(details, credits, reviews)
  end

end
