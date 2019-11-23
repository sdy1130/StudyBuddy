class ItemsController < ApplicationController
    def create
        @repo = Repo.find(params[:repo_id])
        upload_file
        params[:item][:url] = params[:item][:url].original_filename
        @item = @repo.items.create(item_params)
        redirect_to repo_path(@repo)
    end

    def upload_file
        uploaded_file = params[:item][:url]
        File.open(Rails.root.join('private', 'uploads', 
                uploaded_file.original_filename), 'wb') do |file|
            file.write(uploaded_file.read)
        end
    end

    def download_file
        @repo = Repo.find(params[:repo_id])
        @item = @repo.items.find(params[:item_id])

        send_file "#{Rails.root}/private/uploads/#{@item.url}",
                  filename: @item.url
    end

    def destroy
        @repo = Repo.find(params[:repo_id])
        @item = @repo.items.find(params[:id])
        delete_file
        @item.destroy
        redirect_to repo_path(@repo)
    end

    def delete_file
        path_to_file = Rails.root.join('private', 'uploads', @item.url)
        File.delete(path_to_file) if File.exist?(path_to_file)
    end

    private
        def item_params
            params.require(:item).permit(:name, :description, :url)
        end
end
