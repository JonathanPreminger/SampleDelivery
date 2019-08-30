class ArtistDestroyWorkerWorker
  include Sidekiq::Worker

  def perform
    @artist.destroy
  end
end
