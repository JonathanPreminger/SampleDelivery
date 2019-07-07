class RealreleasesController < ApplicationController

  def create
  @realrelease = Realrelease.create(realrelease_params)
  if @realrelease.save
    flash[:success] = "bingo niga"
    redirect_to realreleases_path
  else
    flash[:error] = "failed niga"
    redirect_to realreleases_path
  end
end

  def new
    @realrelease = Realrelease.new(params[:realrelease])
      @artists = Artist.all
  end

  def index
    @realreleases = Realrelease.all
  end

  def edit
     @realrelease = Realrelease.find(params[:id])
  end

  def show
     @realrelease = Realrelease.find(params[:id])
  end

  def update
    @realrelease = Realrelease.find(params[:id])
    @realrelease.update_attributes(realrelease_params)
    flash[:notice] = "#{@realrelease.name} was successfully updated."
    redirect_to tracks_path
  end

  def destroy
    Realrelease.find(params[:id]).destroy
     flash[:success] = "realrelease deleted"
     redirect_to realreleases_url
  end

  private

  def realrelease_params
    params.require(:realrelease).permit(:name, tracks_attributes: [:id, :name, :_destroy])

  end
end
