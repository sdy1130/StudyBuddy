class CoursesController < ApplicationController
    before_action :authenticate_user!, only: [:join_action]

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
        @course = Course.find_by(code: (params[:search]).upcase) 
        
        if @course
            @users = User.all
            render "show"
        else
            @courses = Course.all
            render "index"
        end
    end

    def join_action
        if (user_signed_in?)
            @course = Course.find(params[:course_id])
            unless (@course.users.include?(current_user))
                @course.users << current_user
                @users = User.all
                redirect_to @course
            end
        end
    end
end