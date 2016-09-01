class JobsController < ApplicationController
  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
    set_companies
  end

  def create
    @job = Job.new job_params
    if @job.save
      redirect_to @job
    else
      set_companies
      flash[:errors] = 'Não foi possível criar a vaga'
      render :new
    end
  end

  private

  def job_params
    params.require(:job).permit(
      [:title, :location, :category, :company_id, :description, :featured]
    )
  end

  def set_companies
    @companies = Company.all
  end


end
