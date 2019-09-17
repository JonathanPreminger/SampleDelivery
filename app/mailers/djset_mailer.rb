class DjsetMailer < ApplicationMailer

  def request_to_admin(djset)
    @djset = djset
    @link_to_djsets_path = djsets_url
    mail(to: "jonathan.mete@hotmail.fr",  subject: 'New Djset request',   template_path: 'djsets',
         template_name: 'request_to_admin')
  end

  def acknowledge_receipt(djset)
    @djset = djset
    @link_to_djset_artist = artist_url(@djset.artist.id)
    mail(to: "#{@djset.emailforrequest}",  subject: 'Acknowledge receipt',   template_path: 'djsets',
         template_name: 'acknowledge_receipt')
  end
  def dj_set_request_status_updated(djset)
    @djset = djset
    @link_to_djset_artist = artist_url(@djset.artist.id)
    mail(to: "#{@djset.emailforrequest}",  subject: 'Dj set request status updated',   template_path: 'djsets',
         template_name: 'dj_set_request_status_updated')
  end

end
