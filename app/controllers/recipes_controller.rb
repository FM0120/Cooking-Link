class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
    @recipe = Recipe.new
    @user = current_user
  end

  def show
    @recipe = Recipe.find(params[:id])
    @post_comment = Post_Comment.new
    @recipes = Recipe.new
    @recipes = @user.recipes
    @postcomments = @recipe.comments
    @postcomment = Postcomment.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @user = @recipe.user
  end

  def create
    @recipe = Recipe.new(params[:id])
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
    @recipe = Recipe.new

  end

  private

  def recipe_params
     params.require(:recipe).permit(:recipe_title, :recipe_detail, :trick, :food, :image)
  end

end
