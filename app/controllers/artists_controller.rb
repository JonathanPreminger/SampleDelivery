class ArtistsController < ApplicationController

  def create
  @artist = Artist.create(artist_params)
  if @artist.save
    flash[:success] = "bingo niga"
    redirect_to artists_path
  else
    flash[:error] = "failed niga"
    redirect_to artists_path


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
    Artist.find(params[:id]).destroy
     flash[:success] = "artist deleted"
     redirect_to artists_url
  end

  private

  def artist_params
    params.require(:artist).permit(:name, realreleases_attributes: [:id, :name, :_destroy])
  end
end
