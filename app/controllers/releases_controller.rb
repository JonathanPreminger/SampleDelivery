class ReleasesController < ApplicationController

  def create
  @release = Release.create(release_params)
  if @release.save
    flash[:success] = "bingo niga"
    redirect_to releases_path
  else
    flash[:error] = "failed niga"
    redirect_to releases_path
    

  end
end

  def new
    @release = Release.new(params[:release])
  end

  def index
    @releases = Release.all
  end

  def edit
     @release = Release.find(params[:id])
  end

  def show
     @release = Release.find(params[:id])
  end

  def update
    @release = Release.find(params[:id])
    @release.update_attributes(release_params)
    flash[:notice] = "#{@release.name} was successfully updated."
    redirect_to releases_path
  end

  def destroy
    Release.find(params[:id]).destroy
     flash[:success] = "release deleted"
     redirect_to releases_url
  end

  private

  def release_params
    params.require(:release).permit(:name, :tracks, :year)
  end
end
