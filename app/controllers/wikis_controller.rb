class WikisController < ApplicationController
  respond_to :html, :js
  
  def index
    #@wikis = Wiki.visible_to(current_user)
    @wikis = current_user.wikis.visible_to(current_user)
  end

  def all_wikis
    @wikis = Wiki.visible_to(current_user)
  end

  def collaborate
    @wiki = Wiki.find(params[:id])
  end

  def show
    @wiki = Wiki.find(params[:id])
    @title = @wiki.title
    authorize! :read, @wiki, message: "You need permission to see this Wiki."
  end

  def new
    @wiki = Wiki.new
    authorize! :create, Wiki, message: "You need to be a member to create a newwiki."
  end

  # Adding a create method to the posts_controller.rb

  def create
    @wiki = current_user.wikis.build(params[:wiki])
    authorize! :create, @wiki, message: "You need to be signed up to do that."
    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving the wiki. Please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
    @user = User.find(params[:user_id])
  end

   def update
    @wiki = Wiki.find(params[:id])
    @user = User.find(params[:user_id])
    authorize! :update, @wiki, message: "You need to be signed up to do that."
    if @wiki.update_attributes(params[:wiki])
      flash[:notice] = "Wiki was updated."
      redirect_to [@user, @wiki]
    else
      flash[:error] = "There was an error saving the wiki. Please try again."
      render :edit
    end
  end
  

  def destroy
    @wiki = Wiki.find(params[:id])
    title = @wiki.title
    if @wiki.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully."
      redirect_to wikis_path
    else
      flash[:error] = "There was an error deleting the wiki."
      render :show
    end
  end
  
  def collaborate
    @wiki = Wiki.find(params[:id])
    @user = @wiki.user
   
    @users = User.all

  end

  def collaborators_update
    w = Wiki.find(params[:id])
    w.clear_before_update
    if params[:collaborator].each do |id, user_id|
      Relationship.create(wiki: w, collaborator_id: user_id)
    end
      flash[:notice] = "This wiki's collaborators were updated."
    redirect_to wiki_path
    else
    flash[:notice] = "There was an error addind a collaborator."
    redirect_to new_wiki_collaborator_path
    end
  end
  
end
