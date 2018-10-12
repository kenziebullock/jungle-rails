class ReviewController < ApplicationController
  def create
    puts 'in review controller'
    @review = Review.new
  end
end
