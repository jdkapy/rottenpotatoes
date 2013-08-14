class MoviesController < ApplicationController

   def initialize
        @all_ratings = Movie.all_ratings
        @ratings = Movie.all_ratings

	#super añade caracteristica pero deja la existente
	super     
   end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
 
 
        
    #parametro commit marca que se ha clicado en el boton de filtro     
    if params[:commit]
      #valores seleccionados en el combo
      @ratings = params[:ratings]
      session[:ratings] = @ratings      
      @movies =Movie.where(:rating =>  @ratings.keys )
      #Si tenemos ordenado la lista se filtra ordenado
      
      
      logger.debug("================>"+session[:sort])
      if session[:sort]
        @ssort=session[:sort]
        logger.debug("================>Ordenando movies")
        @movies=Movie.where(:rating =>  @ratings.keys ).order("#{@ssort} ASC")
        logger.debug("================>Ordenado movies wk1")
      end
      logger.debug("================>Ordenado movies wk2")
    elsif params[:sort]#if 
logger.debug("================>Ordenado movies wk3")
    #if params[:sort]
      logger.debug("================>Ordenado movies wk4")
       #ordena por el campo que reciba como parametro
       @sorting = params[:sort]
       session[:sort]    = @sorting
       if session[:ratings] 
         @srating=session[:ratings] 
         @movies=Movie.where(:rating =>  @srating.keys ).order("#{@sorting} ASC")
        else
          @movies = Movie.order("#{@sorting} ASC")
       end
       #@movies = Movie.all        
    else
      logger.debug("================>Ordenado movies wk5")
       #La primera vez que carga aparece sin ordenar
       flash[:notice] = "Sin ordenar"
       @movies = Movie.all
    end
    logger.debug("================>Ordenado movies wk6")

        
        

      
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
