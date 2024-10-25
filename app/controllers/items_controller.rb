class ItemsController < ApplicationController
    before_action :fetch_list, only: %i[ index create edit update destroy toggle_complete ]
    before_action :fetch_item, only: %i[ edit update destroy toggle_complete ]

    def index
        @items = @list.items

        redirect_to @list
    end

    def create
        @item = @list.items.build(item_params)

        return redirect_to @list if @item.save

        @items = @list.items.where.not(id: nil)
        render "lists/show"
    end

    def edit; end

    def update
        return redirect_to @list if @item.update(item_params)

        render :edit
    end

    def destroy
        @item.destroy

        redirect_to @list
    end


    def toggle_complete
        @item.completed = !@item.completed

        redirect_to @list if @item.save
    end

    private

    def item_params
        params.require(:item).permit(:description)
    end

    def fetch_list
        @list = List.find(params[:list_id])
    end

    def fetch_item
        @item = @list.items.find(params[:id])
    end
end
