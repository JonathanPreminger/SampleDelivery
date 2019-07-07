class TracksController < ApplicationController

  def create
  @track = Track.create(track_params)
  if @track.save
    flash[:success] = "bingo niga"
    redirect_to home_index_change_path  
  else
    flash[:error] = "failed niga"
    redirect_to artists_path
  end
end

  def new
    @track = Track.new(params[:track])
      @artists = Artist.all
  end

  def index
    @tracks = Track.all
  end

  def edit
     @track = Track.find(params[:id])
  end

  def show
     @track = Track.find(params[:id])
  end

  def update
    @track = Track.find(params[:id])
    @track.update_attributes(track_params)
    flash[:notice] = "#{@track.name} was successfully updated."
    redirect_to tracks_path
  end

  def destroy
    Track.find(params[:id]).destroy
     flash[:success] = "track deleted"
     redirect_to tracks_url
  end

  private

  def track_params
    params.require(:track).permit(:name, :duration, :realrelease_id)
  end
end
