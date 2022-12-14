class ListsController < ApplicationController

    def new
        @list = List.new
    end

    def edit
        @list = List.find(params[:id])
    end

    def update
        @list = List.find(params[:id])

        if @list.update(list_params)
            redirect_to @list
        else
            render 'edit'
        end
    end

    def create
        @list = List.new(list_params)
        if @list.save
            redirect_to @list
        else
            render 'new'
        end
    end

    def destroy
        @list = List.find(params[:id])
        @list.destroy

        redirect_to Lists_path
    end

    def show
        @list = List.find(params[:id])
    end

    def index
        @lists = List.all
    end

    private
        def list_params
            params.require(:list).permit(:title, :gift_type_id)
        end
end