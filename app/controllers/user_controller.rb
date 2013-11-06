class UserController < ApplicationController
  respond_to :html, :js

  

  def index
    @user = User.find(params[:id])
    @wiki = @user.wikis
  end

  def collaborators
    @user = User.find(params[:id])
  end
end
