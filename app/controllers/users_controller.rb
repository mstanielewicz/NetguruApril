class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @last_reviews = Review.where(user_id: @user.id).order(created_at: :desc).limit(5).includes(:product)
  end
end
