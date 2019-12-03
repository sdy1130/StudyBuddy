class ItemsController < ApplicationController
    def create
        @repo = Repo.find(params[:repo_id])

        # Hack for active storage
        item_params_2 = item_params
        file = item_params[:url]
        filename = item_params[:url].original_filename
        item_params_2[:file] = file
        item_params_2[:url] = filename

        upload_file
        # params[:item][:url] = params[:item][:url].original_filename

        @item = @repo.items.create(item_params_2)
        redirect_to repo_path(@repo)
    end

    def show
        @repo = Repo.find(params[:repo_id])
        @item = @repo.items.find(params[:id])
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
