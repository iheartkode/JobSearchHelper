class JobsController < ApplicationController

  before_action :set_job, only: [:show, :edit, :update, :destroy]

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def edit
    @job = Job.find(params[:id])
  end

  def  update
    if @job.update(job_params)
      redirect_to @job
      flash[:success] = "Job was successfully updated"
    else
      render 'edit'
    end
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      flash[:success] = "Job was successfully created"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @job.destroy
    flash[:success] = "Job was successfully deleted"
    redirect_to root_path
  end

private
    def set_job
      @job = Job.find(params[:id])
    end

    def job_params
      params.require(:job).permit(:company, :contact, :phone, :location,:job_title, :notes)
    end
end
