class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_purchase_info = OrderPurchaseInfo.new
  end

  def create
    @order_purchase_info = OrderPurchaseInfo.new(purchase_info_params)
    if @order_purchase_info.valid?
      Payjp.api_key = "sk_test_2ced90ecfbb0cffe9f35ec0a"
      Payjp::Charge.create(
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
    params.require(:order_purchase_info).permit(:postal_code, :prefecture, :city, :address, :building_name, :phone_number).merge(token: params[:token])
  end
end