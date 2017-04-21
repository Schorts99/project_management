class TasksController < ApplicationController
  before_action :set_project
  before_action :find_task, except: [:create]

  def create
    @task = @project.tasks.create(task_params)
    redirect_to @project
  end

  def destroy
    @task.destroy
    redirect_to @project
  end

  private
    def task_params
      params.require(:task).permit(:content)
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    def find_task
      @task = @project.tasks.find(params[:id])
    end
end
