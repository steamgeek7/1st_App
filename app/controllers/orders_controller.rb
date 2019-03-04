class OrdersController < ApplicationController
  def index
    @orders = Orders.includes(:product).all
  end

  def show
    @orders = Orders.includes(:product).all
  end

  def new
  end

  def create
  end

  def destroy
  end
end
