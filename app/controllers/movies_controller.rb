class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.html.haml by default
  end

  def new
    # title = params[:title]
    # rating = params[:rating]
    # description = params[:description]
    # release_date = params[:release_date]
    @movie = Movie.new
  end

  def create
    # https://api.rubyonrails.org/v6.1.3.2/classes/ActionController/Parameters.html
    # .require is used to mark parameters as required.

    # shortcut of the next 2 line of code: params.require(:movie).permit(:title,:rating,:release_date)
    # params.require(:movie)
    # params[:movie].permit(:title, :rating, :release_date)

    @movie = Movie.create(allowedParams)
    if @movie
      flash[:notice] = "#{@movie.title} added with success"
    else
      flash[:warning] = "#{@movie.title} not added, errors occured"
    end

    # Redirect to movies_path, the homepage /movies
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update_attributes!(allowedParams)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

  def allowedParams
    params.require(:movie).permit(:title, :rating, :release_date)
  end
end
