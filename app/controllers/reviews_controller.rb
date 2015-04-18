class ReviewsController < ApplicationController

  expose(:review)
  expose(:product)

  def edit
  end

  def create
    self.review = Review.new(review_params)
    self.review.user = current_user
    if Review.where(product: product, user: current_user)
      flash[:error] = "Only one review per user!"
      redirect_to category_product_url(category_id: product.category.id, id: product.id)
    elsif review.save
      flash[:notice] = "Review successfully created."
      product.reviews << review
      redirect_to category_product_url(category_id: product.category.id, id: product.id), notice: 'Review was successfully created.'
    else
      render action: 'new'
    end
  end

  def destroy
    review.destroy
    redirect_to category_product_url(category_id: product.category.id, id: product.id), notice: 'Review was successfully destroyed.'
  end

  private
    def review_params
      params.require(:review).permit(:content, :rating)
    end
end
