class ItemsController < ApplicationController
  def index
  end
  def item_params
    params.require(:item).permit(:name, :list_id)
  end
  
  def create
    @list = List.find(params[:list_id])
    @items = @list.items
    @item = @list.items.build(item_params)
    @item.list = @list
    if @item.save
      flash[:notice] = "Item was saved."
      redirect_to @list
    else
      flash[:error] = "There was an error saving the item. Please try again."
      redirect_to @list
    end
  end

  def show
  end

  def new
  end

  def edit
  end
end
