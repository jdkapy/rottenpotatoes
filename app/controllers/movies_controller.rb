class MoviesController < ApplicationController

   def initialize
        @all_ratings = ['G','PG','PG-13','R']
	#super añade caracteristica pero deja la existente
	super     
   end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
 #   @movies = Movie.all


        if params[:sort]
           #ordena por el campo que reciba como parametro
           @sorting = params[:sort]
           flash[:notice] = "Ordenado Ascendentemente por: #{@sorting} "
           @movies = Movie.order("#{@sorting} ASC")
           #@movies = Movie.all
        else
           #La primera vez que carga aparece sin ordenar
           flash[:notice] = "Sin ordenar"
           @movies = Movie.all
        end

      
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end
  

    

end
