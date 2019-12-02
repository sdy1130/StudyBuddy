class ReposController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :join_action]

    def index
        @repos = Repo.all
    end

    def show
        @repo = Repo.find(params[:id])
    end

    def new
        @courses = Course.all
        @courseList = []
        @courses.each do |e|
            @courseList << e.code
        end
        @repo = Repo.new
    end

    def edit
        @repo = Repo.find(params[:id])
    end

    def create
        @repo = Repo.new(repo_params)
        if @repo.save
            #adding the user to repo's user table
            @repo.users << current_user
            @course = Course.find_by(code: (params[:repo][:course_id]))
            @course.repos << @repo
            redirect_to @repo
        else
            render 'new'
        end
    end

    def update
        @repo = Repo.find(params[:id])

        if @repo.update(repo_params)
            redirect_to @repo
        else
            render 'edit'
        end
    end

    def destroy
        @repo = Repo.find(params[:id])
        @repo.destroy
        
        redirect_to repos_path
    end

    def search
        @repo = Repo.find_by(name: (params[:search])) 
        
        if @repo
            @users = User.all
            render "show"
        else
            @repos = Repo.all
            render "index"
        end
    end

    def join_action
        if (user_signed_in?)
            @repo = Repo.find(params[:repo_id])
            unless (@repo.users.include?(current_user))
                @repo.users << current_user
                @users = User.all
                redirect_to @repo
            end
        end
    end

    private
        def repo_params
            params.require(:repo).permit(:name, :description)
        end
end
