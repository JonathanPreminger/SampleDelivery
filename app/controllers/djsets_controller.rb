class DjsetsController < ApplicationController

  def create
    @djset = Djset.create!(djset_params)
    if @djset.save
      redirect_to artists_path
    else
      flash[:alert] = "All the field must be filled for the dj set"
    end
  end

  def edit
    @djset = Djset.find(params[:id])
  end

  def update
    @djset = Djset.find(params[:id])
    @djset.update_attributes(djset_params)
    @artist_id = @djset.artist.id
    redirect_to artists_path
  end

  def new
    @djset = Djset.new(params[:djset])

  end

  def index
    @djsets = Djset.all
  end

  def destroy
    @djset = Djset.find(params[:id])
  end

  private

  def djset_params
    params.require(:djset).permit(:start, :club, :confirmdjset)
  end
end
