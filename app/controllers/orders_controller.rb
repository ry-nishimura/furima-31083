class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    @order_purchase_info = OrderPurchaseInfo.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_purchase_info = OrderPurchaseInfo.new(purchase_info_params)
    if @order_purchase_info.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_info_params[:token],
        currency: 'jpy'
      )
      @order_purchase_info.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render action: :index
    end
  end

  private
  def purchase_info_params
    params.require(:order_purchase_info).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end
end