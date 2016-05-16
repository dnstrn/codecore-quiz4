class CompaniesController < ApplicationController

  def new
    @company = Company.new
  end

  def create
    company_params = params.require(:company).permit(:name)
    @company = Company.new company_params
    if @company.save
      redirect_to companies_path, notice: "Company Created!"
    else
      render :new
    end
  end

  def show
    @company = Company.find params[:id]
    @product = Product.new
  end

  def index
    @companies = Company.all.order("created_at DESC")
    respond_to do |format|
      format.html { render }
      format.json { render json: @companies.select(:id, :name) }
    end
  end

  def destroy
    @company = Company.find params[:id]
    @company.destroy
    redirect_to companies_path
  end

end
