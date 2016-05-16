class ProductsController < ApplicationController

  def create
    @company         = Company.find params[:company_id]
    product_params   = params.require(:product).permit(:name)
    @product         = Product.new product_params
    @product.company = @company
    if @product.save
      redirect_to company_path(@company), notice: "Product Created!"
    else
      render :new
    end
  end

  def index
    @products = Product.all.order(:name)
    respond_to do |format|
      format.html { render }
      format.json { render json: @products.select(:name) }
    end
  end

  def destroy
    product = Product.find params[:id]
    product.destroy
    redirect_to company_path
  end
end
