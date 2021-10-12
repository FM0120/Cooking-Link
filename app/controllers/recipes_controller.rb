class RecipesController < ApplicationController
  def index
    @recipe = Recipe.all
    @recipe = Recipe.new
  end
  
  def show
    @user = User.find(params[:id])
    @post_comment = Post_Comment.new
    @food = Food.new
    @recipes = Food.all
    @recipes = Recipe.new
    @recipes = @user.recipes
  end
  
  def edit
    @recipe = Recipe.find(params[:id])
    @user = @recipe.user
  
  end
  
  def create
    @recipe = Recipe.new(recipe)
    @recipe.user_id = current_user.id
    @recipe.save
  end
  
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.save
  end
  
  def update
    @recipe = Recipe.find(params)
    @recipe.update(recipe_params)
  
  end
  
  def new
    
    
  end
  
end
