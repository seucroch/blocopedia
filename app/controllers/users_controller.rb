class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @wikis = @user.wikis.visible_to(current_user)
 
  end

end