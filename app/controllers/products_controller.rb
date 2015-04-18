class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]
  expose(:category)
  expose(:products)
  expose(:product)
  expose(:review) { Review.new }
  expose_decorated(:reviews, ancestor: :product)

  def index
  end

  def show
  end

  def new
  end

  def edit
    if Product.find(params[:id]).user != current_user
      flash[:error] = 'You are not allowed to edit this product.'
      redirect_to category_product_url(category, product)
    end
  end

  def create
    if current_user
      self.product = Product.new(product_params)

      if product.save
        category.products << product
        redirect_to category_product_url(category, product), notice: 'Product was successfully created.'
      else
        render action: 'new'
      end
    else
      redirect_to new_user_session_path
    end
  end

  def update
    if current_user
      if self.product.user != current_user
        flash[:error] = 'You are not allowed to edit this product.'
        redirect_to category_product_url(category, product)
      else
        if self.product.update(product_params)
          redirect_to category_product_url(category, product), notice: 'Product was successfully updated.'
        else
          redirect_to(category_product_url(category, product))
        end
      end
    else
      redirect_to new_user_session_path
    end
  end

  # DELETE /products/1
  def destroy
    if current_user
      if self.product.user != current_user
        flash[:error] = 'You are not allowed to delete this product.'
        redirect_to category_product_url(category, product)
      else
        product.destroy
        redirect_to category_url(product.category), notice: 'Product was successfully destroyed.'
      end
    else
      redirect_to new_user_session_path
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :category_id)
  end
end
