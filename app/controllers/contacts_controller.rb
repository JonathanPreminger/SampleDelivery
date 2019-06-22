class ContactsController < ApplicationController
  def index
    @contact = Contact.new(params[:contact])

  end
  def new
    @contact = Contact.new(params[:contact])
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    respond_to do |format|
      if @contact.deliver
        # re-initialize Conatact object for cleared form
        @contact = Contact.new
        format.html { render home_index_change_path}
        flash[:success] = "Bien envoyé"
        format.js   { flash.now[:success] = @message = "Thank you for your message. I'll get back to you soon!" }
      else
        flash[:success] = "raté"
        format.html { render 'new' }
        format.js   { flash.now[:error] = @message = "Message did not send." }
      end
    end
  end
end
