class DjsetsController < ApplicationController
    before_action :count_djset_without_response, only: [:index]

  def create
    @djset = Djset.create!(djset_params)
    if @djset.save
      redirect_to artist_path(@djset.artist.id)
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
       redirect_to artist_path(@artist_id)
  end

  def new
    @djset = Djset.new(params[:djset])
    puts '____________________________________________facebook'
    puts current_user.inspect
    puts '____________________________________________remote image'
    puts current_user.remote_image_url.inspect

    puts '____________________________________________facebook'
  end

  def index
    @djsets = Djset.all.order('created_at DESC')
  end


  def destroy
    @djset = Djset.find(params[:id])
  end

  private

  def djset_params
    params.require(:djset).permit(:start, :club, :confirmdjset, :artist_id)
  end
end
