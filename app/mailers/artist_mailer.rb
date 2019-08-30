class ArtistMailer < ApplicationMailer
  default from: "admin@example.com"

  layout "mailer"

    def welcome_email
      @artist = params[:artist]
      @djset = params[:djset]
      @url  = 'http://localhost/djsets'
      mail(to: 'jonathan.mete@hotmail.fr', subject: 'Confirm dj set')
    end
  end
