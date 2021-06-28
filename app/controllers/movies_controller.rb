class MoviesController < ApplicationController
    def index
      @movies = Movie.all
    end

    def PGFilms
      @pgFilms = Movie.where("rating = 'PG'")
    end

    def RFilms
      @rFilms = Movie.where("rating = 'R'")
    end

    def searchFilm(filmToSearch)
      @filmToSearch = Movie.where("title = '#{filmToSearch}'")
    end
end