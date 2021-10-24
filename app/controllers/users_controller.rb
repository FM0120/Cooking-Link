class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
    @recipe = Recipe.new
  end

  def edit
    @user = User.find(params[:id])
    @recipe = current_user.recipes
   unless @user == current_user
      redirect_to user_path(current_user.id)
   end
  end

  def create
     @user = User.new(params[:id])
     @user.user.id = carrent.user.id
     @user.save
  end

  def update
     @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render:edit
    end
  end
  

  private
  
   def user_params
    params.require(:user).permit(:name, :profile_image_id)
   end
end
