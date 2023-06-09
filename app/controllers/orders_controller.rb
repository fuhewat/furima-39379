class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.order.present?

    return unless current_user.id == @item.user_id

    redirect_to root_path
  end

  def create
    @order_address = OrderAddress.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_address.valid?
      pay_item
      @order_address.save

      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :send_municipalities, :send_area_id, :send_address_number, :tel_number, :building_name, :item_id).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )
  end
end
