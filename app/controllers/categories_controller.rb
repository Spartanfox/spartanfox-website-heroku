class CategoriesController < ApplicationController
  before_action only: [:new, :create] do
    redirect_to(categories_path, alert: "You must be owner to make a topic") unless @auth >= @owner
  end
  before_action only: [:edit, :update, :destroy] do
    redirect_to(categories_path, alert: "You must be admin or above to edit/delete topics") unless @auth >= @admin
  end
def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end
  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
    else
      render 'new'
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to @category
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end
private
  def category_params
    params.require(:category).permit(:name, :description)
  end
end
