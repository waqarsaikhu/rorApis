class Api::V1::ProductsController < ApplicationController

  include Authenticable

  before_action :authenticate_request, only: [:index, :show, :create, :update, :destroy]

  def index
    products = Product.all  
    render json: products, status: 200
  end

  def show
    product = Product.find(params[:id])
    if product
    render json: product, status: 200
    else
      render json: { error: 'Product not found' }, status: 404
    end
  end

  def create
    product = Product.new(name: prod_params[:name], brand: prod_params[:brand], price: prod_params[:price])
    if product.save
      render json: product, status: 200
    else
      render json: { error: 'Product not created'}, status: 422
    end
  end

  def update
    product = Product.find(params[:id])
    if product.update(prod_params)
      render json: product, status: 200
    else


      render json: { error: 'Product not updated'}, status: 422
    end
  end

  def destroy
    product = Product.find(params[:id])
    if product.destroy
      render json: { message: 'Product deleted successfully' }, status: 200
    else
      render json: { error: 'Product not deleted' }, status: 404
    end
  end



  
  private
  def prod_params
    params.require(:product).permit(:name, :brand, :price)
  end
end
