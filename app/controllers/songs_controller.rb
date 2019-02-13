class SongsController < ApplicationController
  def new
  end

  def index
  	@songs = Song.all
  end

  def edit
  	@song = Song.find(params[:id])
  end

  def create
  	@song = Song.new(params.require(:song).permit(:name, :genre_id, :artist_id))
  	@song.save

  	redirect_to song_path(@song)
  end

  def update
  	@song = Song.find(params[:id])
  	@song.update(params.require(:song).permit(:name))

  	redirect_to song_path(@song)
  end

  def show
  	@song = Song.find(params[:id])
  end
end