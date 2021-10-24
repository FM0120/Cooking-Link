class MakingsController < ApplicationController
  # def new
  #   @making = Makeing.new
  #   @making = @recipe.making.build ##親モデル.子モデル.buildで子モデルのインスタンス作成
  # end

  # def create
  #   @making = Makeing.new(making_params)
  #   if @making.save
  #     redirect_to root_path
  #   else
  #     render :new
  #   end
  # end

  # private

  # def recipe_params
  #   params.require(:recipe).permit(:recipe_title, :recipe_detail, :trick, :food, :image,
  #   making:[:makeing,:makeing_number,:image,:recipe_id])
  # end
end