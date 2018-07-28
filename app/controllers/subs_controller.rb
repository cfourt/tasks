class SubsController < ApplicationController
  def create
    @task = Task.find(params[:task_id])
    @sub = @task.subs.create(sub_params)
    redirect_to task_path(@task)
  end

  def update
    @task = Task.find(params[:task_id])
    @sub = @task.subs
    
    if @sub.update(sub_params)
      redirect_to @task
    end
  end
 
  private
    def sub_params
      params.require(:sub).permit(:title, :description, :due_date, :completed, :completed_at)
    end
end
