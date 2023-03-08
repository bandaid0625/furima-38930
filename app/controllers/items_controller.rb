class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    @items = Item.order(created_at: :DESC)
    # @item = Item.find(params[:id])
    # @orders = Order.where(order_id: @item.id)こんな感じか？あとで確認
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
    params.require(:item).permit(:image, :item_name, :description, :category_id, :condition_id, :charge_id, :prefecture_id, :sheduled_day_id, :price).merge(user_id: current_user.id)
  end
end
