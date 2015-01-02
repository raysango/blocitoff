class ListsController < ApplicationController
 before_action :authenticate_user!
  def show
   @list = current_user.list
    @items = @list.items

  end
  
  def new
    @list = List.new
    authorize @list
  end
  
  def edit
    @list = List.find(params[:id])
    authorize @list
  end

  def create
    @list = List.new(list_params)
    authorize @list
    @list.user = current_user
    if @list.save
       flash[:notice] = "List was saved."
       redirect_to @list
     else
       flash[:error] = "There was an error saving the list. Please try again."
       render :new
     end
  end
  
  def update
    @list = List.find(params[:id])
    if @list.update_attributes(list_params)
      flash[:notice] = "List was updated"
      redirect_to @list
    else
      flash[:error] = "There was an error updating your list. Please try again"
      render :edit
    end
  end
  def list_params
    params.require(:list).permit(:title, :user_id)
  end
  
  def destroy
    @list = List.find(params[:id])
    title = @list.title
    if @list.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully."
      redirect_to root_path
    else
      flash[:error] = "There was an error deleting the List"
      render :show
    end
  end
end
