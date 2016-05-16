class Api::V1::Companies < ApplicationController

  def index
    @campaigns = Company.order(:created_at)
    # this will render /api/v1/views/index.json.jbuilder
  end

  def show
    company = Company.find params[:id]
    render json: company
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      render json: company
    else
      render json: {errors: company.errors.full_messages}
    end
  end

  private

  def company_params
    params.require(:company).permit(:name)
  end

end
