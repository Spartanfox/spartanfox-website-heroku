class MessagesController < ApplicationController
before_action only: [:destroy] do
  redirect_back(fallback_location: root_path, alert: "You must be mod or above to delete messages") unless @auth >= @mod
end
  def create
    @topic = Topic.find(params[:topic_id])
    @message = @topic.messages.new(message_params)
    #messages arent really connected to users accounts just sets the creator to their name
    #mostly due to having created the forum database and then adding devise

    if user_signed_in?
      @message.creator = current_user.username
    else
      @message.creator = "Anon"
    end
    if @message.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path, alert: @message.errors.first)
    end
  end
  def destroy
    @topic = Topic.find(params[:id])
    @message = @topic.messages.find(params[:topic_id])
    @message.destroy
    redirect_back(fallback_location: root_path)
  end
  private
  def message_params
    params.require(:message).permit(:message)
  end
end
