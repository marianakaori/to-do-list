class ListsController < ApplicationController
    before_action :fetch_list, only: %i[ show edit update destroy ]

    def index
        @lists = List.all
    end

    def new
        @list = List.new
    end

    def create
        @list = List.new(list_params)

        return redirect_to @list if @list.save

        render :new
    end

    def show; end

    def edit; end

    def update
        return redirect_to @list if @list.update(list_params)

        render :edit
    end

    def destroy
        @list.destroy

        redirect_to lists_path
    end

    private

    def list_params
        params.require(:list).permit(:name)
    end

    def fetch_list
        @list = List.find(params[:id])
    end
end
