class CoursesController < ApplicationController
    def index
        @courses = Course.all
    end
    def show
        @posts = Post.all
        # Get course
        @course = Course.find(params[:id])
    end
end