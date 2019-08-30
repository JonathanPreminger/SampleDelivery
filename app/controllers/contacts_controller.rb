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
      if ContactMailerWorker.perform_async
        # re-initialize Conatact object for cleared form
        @contact = Contact.new
        format.html { render 'new' }
        flash[:success] = "Bien envoyé !"
        format.js   { flash.now[:success] = @message = "Thank you for your message. I'll get back to you soon!" }
      else
        flash[:success] = "raté"
        format.html { render 'new' }
        format.js   { flash.now[:error] = @message = "Message did not send." }
      end
    end
  end
end
