class PostsController < ApplicationController
    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)

        post_params_2 = post_params
        post_params_2[:user] = 

        if @post.save
            redirect_to @post
          else
            render 'new'
          end
    end

    def show
        @post = Post.find(params[:id])
    end

    private
        def post_params
            params.require(:post).permit(:title, :description, :category)
        end
end
