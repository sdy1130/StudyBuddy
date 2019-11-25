class CoursesController < ApplicationController
    def index
        @courses = Course.all
    end
    def show
        @posts = Post.all
        # Get course
        @course = Course.find(params[:id])
        @users = User.all
    end

    def search
        @course = Course.find_by(name: (params[:search]).upcase) 
        
        if @course
            @users = User.all
            render "show"
        else
            @courses = Course.all
            render "index"
        end
    end
end