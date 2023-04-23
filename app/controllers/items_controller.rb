class ItemsController < ApplicationController
  def index
      
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :status_id, :postage_id, :region_id, :schedule_id, :price, :image).merge(user_id: current_user.id)
  end
end
