class ItemsController < ApplicationController
  respond_to :html, :js
  
  def item_params
    params.require(:item).permit(:name, :list_id, :id)
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
  
  def destroy
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id])
    if @item.destroy
      flash[:notice]= "Item completed and removed from your list"
    else
      flash[:error]= "Item couldn't be removed try again"
    end
    respond_with(@item) do |format|
      format.html { redirect_to[@list]}
     end
  end
end
