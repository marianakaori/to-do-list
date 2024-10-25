class ItemsController < ApplicationController
    before_action :fetch_list, only: %i[ index create ]

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

    private

    def item_params
        params.require(:item).permit(:description)
    end

    def fetch_list
        @list = List.find(params[:list_id])
    end
end
