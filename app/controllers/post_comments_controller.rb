class PostCommentsController < ApplicationController
   def create
    @postcomment = PostComment.new(comment_params)
    if @postcomment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
   end

    private
    def comment_params
      params.require(:post_comment).permit(:comment).merge(recipe_id: params[:recipe_id],user_id: current_user.id)
    end
end
