class OrdersController < ApplicationController
  before_action :authenticate_user!, onry: :index
  before_action :item, only: [:index, :create]
  before_action :move_to_index, only: :index

  def index
    @address = OrderOrderAddress.new
  end
  def create
    @address = OrderOrderAddress.new(order_params)
    if @address.valid?
      pay_item
      @address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_order_address).permit(:post_code, :prefecture_id, :city, :address, :phone_number, :building_name).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  
        card: order_params[:token], 
        currency: 'jpy' 
      )
  end

  def item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if @item.order != nil 
       redirect_to root_path
    else
      @item.order == nil
      redirect_to root_path
    end
  end
end
