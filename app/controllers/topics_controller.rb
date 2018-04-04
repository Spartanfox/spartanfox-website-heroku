class TopicsController < ApplicationController
before_action only: [:new, :create] do
  redirect_to(categories_path, alert: "You must be signed in to make a topic") unless user_signed_in?
end
before_action only: [:edit, :update, :delete] do
  redirect_to(categories_path, alert: "You must be mod or above to edit/delete topics") unless @auth >= @mod
end
def new
    @category = Category.find(params[:category_id])
    @topic = @category.topics.new
  end
  def edit
    @category = Category.find(params[:id])
    @topic = @category.topics.find(params[:category_id])
  end
  def show
    @topic = Topic.find(params[:category_id])
  end

  def create
    @category = Category.find(params[:id])
    @topic = @category.topics.new(topic_params)
    @topic.creator = current_user.username
    if @topic.save
      redirect_to category_path(@category)
    else
      render 'new'
    end
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update(topic_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end
  def destroy
    @category = Category.find(params[:id])
    @topic = @category.topics.find(params[:category_id])
    @topic.destroy
    redirect_to category_path(@category)
  end
  private
  def topic_params
    params.require(:topic).permit(:title, :description)
  end
end
