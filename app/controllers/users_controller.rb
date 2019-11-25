class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    if (params[:format])
      @user = User.find(params[:format])
    else
      @user = current_user
    end
    
  end
end
