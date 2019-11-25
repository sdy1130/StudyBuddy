class UsersController < ApplicationController

  def profile
    if (current_user && params[:format] == current_user.id)
      @user = current_user
    else
      @user = User.find(params[:format])
    end
    
  end
end
