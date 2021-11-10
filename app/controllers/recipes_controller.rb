class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
    @recipe = Recipe.new
    @user = current_user
  end

  def show
    @recipe = Recipe.find(params[:id])
    @postcomment = PostComment.new
    @recipes = Recipe.new
    # @recipes = @user.recipes
    # @postcomments = @recipe.comments
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @user = @recipe.user
    unless @user == current_user
      redirect_to recipes_path
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to recipes_path, notice: "You have created recipe successfully."
    else
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  def update
    @recipe = Recipe.find(params)
    @recipe.update(recipe_params)
    if @book.update(book_params)
      redirect_to recipe_path(@recipe), notice: "You have updated recipe successfully."
    else
      render "edit"
    end
  end


  def new
    @recipe = Recipe.new
    @makings = @recipe.makings.build ##親モデル.子モデル.buildで子モデルのインスタンス作成
  end

  private

  def recipe_params
     params.require(:recipe).permit(:recipe_title, :recipe_detail, :trick, :food, :image,makings_attributes: [:making_detail,:image,:_destroy])
  end
end
