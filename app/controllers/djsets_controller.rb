class DjsetsController < ApplicationController

  def create
    @djset = Djset.create(djset_params)
    if @djset.save
      flash[:notice] = "Dj set create for #{@djset.artist} the #{@djset.start}"
      puts "yoooooooooooooooloooooooooooooooooooooooooooooo"
      redirect_to artists_path
    else
      puts "faileeeeeeeeeeed"
      redirect_to artists_path
    end
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
    params.require(:djset).permit(:start, :club)
  end
end
