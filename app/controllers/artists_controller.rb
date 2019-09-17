class ArtistsController < ApplicationController
protect_from_forgery

  def create
  @artist = Artist.create(artist_params)
      respond_to :js
    end

  def new
    @artist = Artist.new(params[:artist])
    @djset = Djset.new(params[:djset])
  end

  def index
    @artists = Artist.all
  end

  def edit
     @artist = Artist.find(params[:id])
  end

  def show
     @artist = Artist.find(params[:id])
     @artist_djset = @artist.djsets
  end

  def update
    @artist = Artist.find(params[:id])
    @djsets_count_before = @artist.djsets.count
    if @artist.update_attributes(artist_params)
      flash.now[:notice] = "#{@artist.name.upcase} was successfully updated ! "

      if @djsets_count_before < @artist.djsets.count
        puts '_________________________________________________________________grandit'
        ArtistMailer.with(artist: @artist).welcome_email.deliver_later
        puts '___________________________________________________envoi du mail'
      else
        puts "_________________________________________________________________update didn't concern dj set"
      end
      render :show
    else
      flash.now[:alert] = "All the field must be filled for the artist"
      render :edit
    end
  end

  def number_of_djset
    @artist = Artist.find(params[:id])
    @djset_number = @artist.djsets.count
    puts "___________________________________________________#{@djset_number} djsets number for #{@artist.name}"
  end

  def destroy
    @artist = Artist.find(params[:id])
    ArtistDestroyWorkerWorker.perform_async
    respond_to do |format|
     format.js
     format.html { redirect_to artists_url, notice: 'artist was successfully destroyed.' }
     format.json { head :no_content }
  end
end

  def calendar
    @artist = Artist.find(params[:id])
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :image, realreleases_attributes: [:id, :name, :image, :production_year, :_destroy], djsets_attributes: [:id, :start, :club, :confirmdjset, :_destroy, :_create])
  end
end
