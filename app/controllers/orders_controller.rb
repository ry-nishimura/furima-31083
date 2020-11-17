class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_purchase_info = OrderPurchaseInfo.new
  end

  def create
    @order_purchase_info = OrderPurchaseInfo.new(purchase_info_params)
    if @order_purchase_info.valid?
      @order_purchase_info.save
      redirect_to controller: :items, action: :index
    else
      render action: :index
    end
  end
end