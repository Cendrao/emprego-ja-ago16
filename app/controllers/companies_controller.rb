class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update]

  def show
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new company_params
    if @company.save
      redirect_to @company
    else
      flash[:errors] = 'Não foi possível criar a Empresa'
      render :new
    end
  end

  def edit
  end

  def update
    if @company.update company_params
      redirect_to @company
    else
      flash[:errors] = 'Não foi possível atualizar a Empresa'
      render :edit
    end
  end

  private

  def company_params
    params.require(:company).permit([:name, :location, :mail, :phone])
  end

  def set_company
    @company = Company.find(params[:id])
  end
end
