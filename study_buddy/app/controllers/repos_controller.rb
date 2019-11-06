class ReposController < ApplicationController
    def index
        @repos = Repo.all
    end

    def show
        @repo = Repo.find(params[:id])
    end

    def new
        @repo = Repo.new
    end

    def edit
        @repo = Repo.find(params[:id])
    end

    def create
        @repo = Repo.new(repo_params)
        if @repo.save
            # What odes this redirect to?
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

    private
        def repo_params
            params.require(:repo).permit(:name, :description)
        end
end
