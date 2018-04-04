class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    #before_action :authenticate_user!
  #  before_action :authenticate_user! except: [:index, :show]
  before_action :get_authorisation

  def get_authorisation
    #only putting these here for readability of code but will move when
    #I know of a better place to stick static values
    @mod = 10
    @admin = 20
    @owner = 30

    if user_signed_in?
      @auth = current_user.authorisation
    else
      @auth = -1
    end
  end
end
