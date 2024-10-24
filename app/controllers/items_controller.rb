class ItemsController < ApplicationController
    def create
        @list = List.find(params[:list_id])
        @item = @list.items.build(item_params)

        return redirect_to @list if @item.save

        redirect_to @list, alert: "Erro ao adicionar o item."
    end

    private

    def item_params
        params.require(:item).permit(:description)
    end
end
