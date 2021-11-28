class FavolitesController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    favolite = current_user.favolites.new(recipe_id: @recipe.id)
    favolite.save!
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    favolite = current_user.favolites.find_by(recipe_id: @recipe.id)
    favolite.destroy
  end
end
