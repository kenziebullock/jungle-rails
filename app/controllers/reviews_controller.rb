class ReviewsController < ApplicationController
  
  before_filter :check_user
  
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

  def check_user
    if !current_user
      redirect_to :products
    end
  end
end
