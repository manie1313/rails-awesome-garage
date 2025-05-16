class ReviewsController < ApplicationController
  def create
    # raise
    # params[:reviews]
    # params[:car_id]
    @review = Review.new(strong_params)
    @car = Car.find(params[:car_id])
    @review.car = @car
    # raise
    # car_id is nil so we need the reassign the FK
    if @review.save
      redirect_to car_path(@car)
    else
      render 'cars/show'
    end
  end

  private

  def strong_params
    params.require(:review).permit(:comment, :rating)
  end
end
