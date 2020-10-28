class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :create
  before_action :set_item, only: [:index, :create]
#ログインしていないユーザーは,購入ページに遷移しようとすると、トップページでなくログインページに遷移する
#ログイン・ログアウトの状態に関わらず、URLを直接入力して売却済み商品の商品購入ページへ遷移しようとすると、トップページに遷移することok
  def index
    if @item.order.blank? && user_signed_in? && current_user.id != @item.user_id
      @user_order = UserOrder.new
    elsif @item.order.present? 
      redirect_to root_path
    else 
      redirect_to new_user_session_path
    end
  end

  def create
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      pay_item
      @user_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:user_order).permit(:postal_code, :prefecture_id, :city, :block, :building, :phone, :order_id, :token).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
