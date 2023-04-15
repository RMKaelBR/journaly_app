class TasksController < ApplicationController
  def show
    @categories = Category.by_user(current_user).pluck(:id)
    @tasks = Task.includes(:category).where(category_id: @categories)
    @task_id = Task.includes(:category).where(category_id: @categories).pluck(:category_id)
    @categories_tasks = Category.find(@task_id)
  end

  def new
    @task = Task.new
  end

  private
  def set_category
    @category = Category.by_user(current_user).find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end 

  def set_task
    @tasks = Task.includes(:category).where(category_id: @categories)
  end
end
