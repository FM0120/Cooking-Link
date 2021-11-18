class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
    @recipe = Recipe.new
    @recipes = current_user.recipes
  end

  def edit
    @user = User.find(params[:id])
    @recipe = current_user.recipes
   unless @user == current_user
      redirect_to recipe_path
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
      redirect_to recipes_path, notice: "You have updated user successfully."
    else
      redirect_to edit_user_path(@user.id)
    end
  end
  private

   def user_params
    params.require(:user).permit(:name, :profile_image)
   end
end
