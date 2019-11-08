class CommentsController < ApplicationController
    def create
        @course = Course.find(params[:course_id])
        @post = Post.find(params[:post_id])

        comment_params_2 = comment_params
        # HACK HACK HACK
        # HACK HACK HACK
        # HACK HACK HACK
        comment_params_2[:user_id] = 1

        @comment = @post.comments.create(comment_params_2)
        redirect_to course_post_path(@course, @post)
    end
     
    private
        def comment_params
            params.require(:comment).permit(:description)
        end
end
