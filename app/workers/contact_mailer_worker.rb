class ContactMailerWorker
  include Sidekiq::Worker

  def perform
    @contact.deliver
  end
end
