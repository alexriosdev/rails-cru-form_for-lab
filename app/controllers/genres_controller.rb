class GenresController < ApplicationController
  before_action :genre_find, only: [:show, :edit, :update]

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(strong_params(:name))
    @genre.save
    redirect_to genre_path(@genre)    
  end

  def show
  end

  def edit
  end

  def update
    @genre.update(strong_params(:name))
    redirect_to genre_path(@genre)
  end

  private

  def genre_find
    @genre = Genre.find(params[:id])
  end

  def strong_params(*args)
    params.require(:genre).permit(*args)
  end
end