class TasksController < ApplicationController
before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
    # find (see above)
  end

  def new
    # GET the task creation form
    @task = Task.new
  end

  def create
    # POST to create the data
    Task.create(task_params)
    # no need for app/views/restaurants/create.html.erb
    redirect_to tasks_path(@task)
  end

  def edit
    # find (see above)
  end

  def update
    # find (see above)
    @task.update(task_params)
    # no need for app/views/restaurants/update.html.erb
    redirect_to tasks_path(@task)
  end

  def destroy
    # find (see above)
    # then destroy
    @task.destroy
    # no need for app/views/restaurants/destroy.html.erb
    redirect_to tasks_path
  end

private

def task_params
  # *Strong params*: You need to *whitelist* what can be updated by the user
  # Never trust user data!
  params.require(:task).permit(:name, :content)
  # @task = Task.find(params[:name], params[:content])
end

def set_task
  @task = Task.find(params[:id])
end

end
