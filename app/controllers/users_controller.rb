class UsersController < ApplicationController

  def profile
    if (params.has_key?(:format))
      @user = User.find(params[:format])
    else
      @user = current_user
    end
    
  end
end
