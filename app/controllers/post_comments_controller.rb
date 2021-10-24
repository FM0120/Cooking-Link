class PostCommentsController < ApplicationController
   def create
    @postcomment = PostComment.new(comment_params)
    @postcomment.user_id = current_user.id
    if @postcomment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
   end

    private
    def comment_params
      params.require(:post_comment).permit(:comment)
    end
end
