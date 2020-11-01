class ArtistsController < ApplicationController
  before_action :artist_find, only: [:show, :edit, :update]

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(strong_params(:name, :bio))
    @artist.save
    redirect_to artist_path(@artist)    
  end

  def show
  end

  def edit
  end

  def update
    @artist.update(strong_params(:name, :bio))
    redirect_to artist_path(@artist)
  end

  private

  def artist_find
    @artist = Artist.find_by(params[:id])
  end

  def strong_params(*args)
    params.require(:artist).permit(*args)
  end
  
end