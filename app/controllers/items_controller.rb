class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :move_to_index, only: :new

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :condition_id, :deliver_charge_id, :deliver_day_id, :prefecture_id, :price)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
