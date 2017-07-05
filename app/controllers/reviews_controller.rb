class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  # POST /review
  # POST /review.json
  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
      if @review.save
        redirect_to restaurant_path(@restaurant)
      else
        render :new
      end
  end

  # PATCH/PUT /review/1
  # PATCH/PUT /review/1.json


  # DELETE /review/1
  # DELETE /review/1.json
  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
     params.require(:review).permit(:content, :rating)
    end
end
