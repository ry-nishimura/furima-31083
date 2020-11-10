class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    # binding.pry
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :shipping_fee_type_id, :prefecture_id, :delivery_time_id, :price, :image).merge(user_id: current_user.id)
  end
end