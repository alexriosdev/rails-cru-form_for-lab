class SongsController < ApplicationController
  before_action :song_find, only: [:show, :edit, :update]

  def index
    @songs = Song.all
  end
  
  def new
    @song = Song.new
  end

  def create
    @song = Song.new(strong_params(:name, :artist_id, :genre_id))
    @song.save
    redirect_to song_path(@song)    
  end

  def show
  end

  def edit
  end

  def update
    @song.update(strong_params(:name, :artist_id, :genre_id))
    redirect_to song_path(@song)
  end

  private

  def song_find
    @song = Song.find(params[:id])
  end

  def strong_params(*args)
    params.require(:song).permit(*args)
  end

end