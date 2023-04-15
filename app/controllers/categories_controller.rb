class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: %i[ show edit update destroy ]

  def index
    @categories = Category.by_user(current_user)
  end

  def show
    @categories = Category.by_user(current_user).pluck(:id)
    @tasks = Task.includes(:category).where(category_id: @categories)
  end

  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)

    @category.user = current_user
    if @category.save
      redirect_to categories_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to categories_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  private
  def set_category
    @category = Category.by_user(current_user).find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end