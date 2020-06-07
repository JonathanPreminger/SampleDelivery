class DjsetsController < ApplicationController
  def create
    #if user_signed_in?
      @djset = Djset.create!(djset_params)
    #  if @djset.save
        DjsetMailer.request_to_admin(@djset).deliver_later
        DjsetMailer.acknowledge_receipt(@djset).deliver_later


        redirect_to artist_path(@djset.artist.id)
    #  else
    #    flash[:alert] = "All the field must be filled for the dj set"
    #  end
    #else
    #  redirect_to new_user_session_path
  #end
end

  def edit
    @djset = Djset.find(params[:id])
  end

  def update
    #if user_signed_in?
      #if current_user.admin?
        @djset = Djset.find(params[:id])

        if params[:confirm_true]
          @djset.update_attributes(:confirmdjset => 'true')
          puts "yayayaayyayayayayayayayyayayayay"
        elsif params[:confirm_false]
          @djset.update_attributes(:confirmdjset => 'false')
            puts "ouyouyouyoyuyou"
        end
        @artist_id = @djset.artist.id
        puts "____________________________________ deliver djset update mailer"
        DjsetMailer.dj_set_request_status_updated(@djset).deliver_later
        puts "____________________________________ deliver djset update mailer"
        flash[:notice] = "Booking status updated"
        redirect_to artist_path(@artist_id)
     #  else
      #  flash[:alert] = "you're not connected as admin"
      #{}end
    #else
    #  flash[:alert] = "you're not connected"
    #   redirect_to artist_path(@artist_id)
  #  end
  end


  def new
    @djset = Djset.new(params[:djset])
  end

  def index
    @djsets = Djset.all.order('created_at DESC')
  end


  def destroy
    @djset = Djset.find(params[:id])
  end

  private

  def djset_params
    params.require(:djset).permit(:start, :club, :confirmdjset, :emailforrequest, :artist_id)
  end
end
