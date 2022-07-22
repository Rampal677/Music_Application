class HomeController < ApplicationController
  def index
    @q = MusicAlbum.all.ransack(params[:q])
    @publish = @q.result.includes(:tags)
  end
end
