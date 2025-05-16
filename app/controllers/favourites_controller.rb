class FavouritesController < ApplicationController
  def index
    @favourites = Favourite.all
  end
  def create
    @car = Car.find(params[:car_id])
    @favourite = Favourite.new
    @favourite.car = @car

    if @favourite.save
      redirect_to car_path(@car)
    else
      # specify the path otherwise the computer will think we are inside the show of fav
      render 'cars/show', status: unprocessable_entity
    end
  end

  def destroy
    @favourite = Favourite.find(params[:id])
    @favourite.destroy
    redirect_to favourites_path
  end
end
