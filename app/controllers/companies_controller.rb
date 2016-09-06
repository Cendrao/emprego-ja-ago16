class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit]

  def show
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.create company_params
    redirect_to @company
  end

  def edit
  end

  def update
    company = Company.update company_params
    redirect_to company
  end

  private

  def company_params
    params.require(:company).permit([:name, :location, :mail, :phone])
  end

  def set_company
    @company = Company.find(params[:id])
  end
end
