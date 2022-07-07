class MovieService
  def self.get_top_movies
    get_url('https://api.themoviedb.org/3/movie/top_rated?api_key=51d49edf3ab3c81a41b7ebae911d7196')
  end

  def self.get_movie_search(string)
    get_url("http://api.themoviedb.org/3/search/movie?api_key=51d49edf3ab3c81a41b7ebae911d7196&query=#{string}")
  end

  def self.get_url(url)
    response = Faraday.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
