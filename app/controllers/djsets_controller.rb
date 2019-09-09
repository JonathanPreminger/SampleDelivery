class DjsetsController < ApplicationController
    before_action :count_djset_without_response, only: [:index]

  def create
    @djset = Djset.create!(djset_params)
    if @djset.save
      redirect_to
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

  end

  def index
    @djsets = Djset.all.order('created_at DESC')
  end

  def count_djset_without_response
    @djsets = Djset.all.order('created_at DESC')
    puts "___________________________________________________________________________________"
    @pending_dj_set = @djsets.select { |fuck| fuck.confirmdjset == nil }
    puts @pending_dj_set.count
    @djset_request_pending = @pending_dj_set.count
    puts "_____________________________________________________________________________________"
  end



  def destroy
    @djset = Djset.find(params[:id])
  end

  private

  def djset_params
    params.require(:djset).permit(:start, :club, :confirmdjset)
  end
end
