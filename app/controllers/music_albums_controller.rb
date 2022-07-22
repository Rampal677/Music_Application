class MusicAlbumsController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = current_user.music_albums.ransack(params[:q])
    @publish = @q.result.published.includes(:tags)
    @unpublish = @q.result.unpublished.includes(:tags)
  end

  def show
    @musicalbum = MusicAlbum.find(params[:id])
  end

  def new
    @musicalbum = MusicAlbum.new
  end

  def create
    @musicalbum = current_user.music_albums.new(musicalbum_params)

    if @musicalbum.save
      redirect_to @musicalbum
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @musicalbum = MusicAlbum.find(params[:id])
  end

  def update
    @musicalbum = MusicAlbum.find(params[:id])

    if @musicalbum.update(musicalbum_params)
      redirect_to @musicalbum
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @musicalbum = MusicAlbum.find(params[:id])
    @musicalbum.destroy
    redirect_to root_path
  end

  private

  def musicalbum_params
    params.require(:music_album).permit(:name, :description, :price, :publish, :cover_image, :all_tags, :file)
  end
end
