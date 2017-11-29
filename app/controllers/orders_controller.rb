# frozen_string_literal: true

class OrdersController < ProtectedController
  before_action :set_order, only: %i[show update destroy]

  # GET /orders
  def index
    @orders = current_user.orders.all

    render json: @orders
  end

  # GET /orders/1
  def show
    render json: @order
  end

  # POST /orders
  def create
    # @order = Order.new(order_params)
    @order = current_user.orders.build(order_params)

    if @order.save
      render json: @order, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    # @order = Order.find(params[:id])
    @order = current_user.orders.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def order_params
    params.require(:order).permit(:name, :address, :email, :phone_number, :amount, :user_id)
  end
end
