class ArtistsController < ApplicationController
protect_from_forgery

  def create
  @artist = Artist.create(artist_params)

      respond_to do |format|
        if @artist.save
          format.js
          format.html { redirect_to @artist, notice: 'ARTIST was successfully created.' }
          format.json { render :show, status: :created, location: @artist }
        else
          format.html { render :new }
          format.json { render json: @artist.errors, status: :unprocessable_entity }
          format.js
        end
      end
    end

  def new
    @artist = Artist.new(params[:artist])
  end

  def index
    @artists = Artist.all
  end

  def edit
     @artist = Artist.find(params[:id])
  end

  def show
     @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update_attributes(artist_params)
      flash[:notice] = "#{@artist.name} was successfully updated."
      redirect_to artists_path
    else
      flash[:notice] = "#{@artist.name} wasn't updated"
      render edit_artist_path
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    respond_to do |format|
     format.js
     format.html { redirect_to artists_url, notice: 'artist was successfully destroyed.' }
     format.json { head :no_content }
   end
  end

  private


  def artist_params
    params.require(:artist).permit(:name, :image, realreleases_attributes: [:id, :name, :image, :year, :_destroy])
  end
end
