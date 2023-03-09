class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit, :update]

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

  def show
    @user = User.find(@item.user_id)
  end

  def edit
    if current_user.id != @item.user_id
      redirect_to action: :index
    end
    # if ((@item.orders)!= nil) || (current_user.id != @item.user_id)
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render action: :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :condition_id, :charge_id, :prefecture_id, :sheduled_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
