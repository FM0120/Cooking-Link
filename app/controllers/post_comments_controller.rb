class PostCommentsController < ApplicationController
   def create
    @postcomment = Comment.new(comment_params)
    @postcomment.user_id = current_user.id
    if @pocomment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
   end

    private
    def comment_params
      params.require(:post_comment).permit(:content)
    end
end
