class ReposController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

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

    private
        def repo_params
            params.require(:repo).permit(:name, :description)
        end
end
