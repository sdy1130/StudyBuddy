class ItemsController < ApplicationController
    def create
        @repo = Repo.find(params[:repo_id])
        @item = @repo.items.create(item_params)
        redirect_to repo_path(@repo)
    end

    def destroy
        @repo = Repo.find(params[:repo_id])
        @item = @repo.items.find(params[:id])
        @item.destroy
        redirect_to repo_path(@repo)
    end

    private
        def item_params
            params.require(:item).permit(:name, :description, :url)
        end
end
