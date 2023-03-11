class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new
    if current_user.id == @item.user_id || @item.order != nil
      redirect_to root_path
    end
  end

  def new
    @order_shipping = OrderShipping.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new(order_params)
    if @order_shipping.valid?
      @order_shipping.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:order_shipping).permit(:postal_code, :prefecture_id, :city, :street_num, :building, :tel, :item_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
