class DjsetsController < ApplicationController

  def create
    @djset = Djset.create(djset_params)
    if @djset.save
      flash[:notice] = "Dj set create for #{@djset.artist} the #{@djset.start} but you got to validate #{@djset.djsetvalidates.id}"
      puts "yoooooooooooooooloooooooooooooooooooooooooooooo"
      Djsetvalidate.create(djsetvalidates_params)
      puts @djset.djsetvalidate.id
      redirect_to artists_path
    else
      flash[:alert] = "All the field must be filled"
      puts "faileeeeeeeeeeed whyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy"
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

  def valid_djset
    @djset = Djset.find(params[:id])
    @djset.confirmdjset == true
  end

  def rejected_djset
    @djset = Djset.find(params[:id])
    @djset.confirmdjset == false
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
