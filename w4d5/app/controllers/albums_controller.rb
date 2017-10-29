class AlbumsController < ApplicationController
  before_action :verify_login


  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      redirect_to new_album_url
    end
  end

  def new
    @album = Album.new
    render :new
  end

  def edit
    @album = Album.find_by(id: params[:id])
    render :edit
  end

  def update
    @album = Album.find_by(id: params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def destroy
    @album = Album.find_by(id: params[:id])
    @album.delete
    redirect_to albums_url
  end

  def index
    @albums = Album.all
    render :index
  end

  def show
    @album = Album.find_by(id: params[:id])
  end

  private
    def album_params
      params.require(:album).permit(:title, :band_id, :yr, :is_live)
    end

end
