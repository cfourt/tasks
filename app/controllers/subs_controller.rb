class SubsController < ApplicationController
  def create
    @task = Task.find(params[:task_id])
    @sub = @task.subs.create(sub_params)
    redirect_to task_path(@task)
  end

  def show
    if @sub.update(sub_params)
      redirect_to @task
    end
  end

  def update
    @sub = Sub.find(params[:id])
    
    if @sub.update(sub_params)
      redirect_to @sub.task
    end
  end

  def complete_sub
    binding.pry
    @sub = Task.find(params[:id])
    @sub.update(completed: true, completed_at: Time.now)
    redirect_to :back
  end
 
  private
    def sub_params
      params.permit(:title, :description, :due_date, :completed, :completed_at, :id)
    end
end
