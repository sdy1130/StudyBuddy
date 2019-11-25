class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:new]

    def new
        @post = Post.new
        @course = Course.find(params[:course_id])
    end

    def edit
        @course = Course.find(params[:course_id])
        @post = @course.posts.find(params[:id])
    end

    def create
        @course = Course.find(params[:course_id])

        # Add current user id to the hash
        post_params_2 = post_params
        post_params_2[:user_id] = current_user.id

        @post = @course.posts.create(post_params_2)
        redirect_to course_post_path(@course, @post)
    end

    def update
        @course = Course.find(params[:course_id])
        @post = @course.posts.find(params[:id])

        # Add current course and user id to the hash
        post_params_2 = post_params
        post_params_2[:course_id] = @course.id
        post_params_2[:user_id] = current_user.id

        if @post.update(post_params_2)
            redirect_to course_post_path(@course, @post)
        else
            render 'edit'
        end
      end

    def show
        @course = Course.find(params[:course_id])
        @post = @course.posts.find(params[:id])
    end

    def destroy
        @course = Course.find(params[:course_id])
        @post = @course.posts.find(params[:id])
        @post.destroy

        redirect_to course_path(@course)
    end

    private
        def post_params
            params.require(:post).permit(:title, :description, :category)
        end
end
