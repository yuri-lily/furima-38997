class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :sold_out

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
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
    params.require(:order_address).permit(:postal_cade, :prefecture_id, :city, :address, :address_sub, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: order_params[:token], 
      currency: 'jpy'               
    )
  end

  def sold_out
    if current_user.id != @item.user_id && @item.order != nil
      redirect_to root_path
    end
  end

end
