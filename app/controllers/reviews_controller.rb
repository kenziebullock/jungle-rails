class ReviewsController < ApplicationController
  before_action :something
  
  def create
    @review = Review.new(review_params)

    if @review.save
      redirect_to :back
    else
      puts 'didnt save'
      redirect_to root_path
    end
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to :back
  end

  private

  def review_params
    params.require(:review).permit(
      :description,
      :rating,
      :product_id,
      :user_id
    )
  end
end
