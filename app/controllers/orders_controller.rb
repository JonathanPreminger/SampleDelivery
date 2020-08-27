class OrdersController < ApplicationController
  def create
    puts "==============================================="
    if Cart.all.count == 0
      @cart = Cart.create
      @order = Order.create(cart_id:@cart.id)
    else
      @order = Order.create(cart_id:Cart.first.id)
    end
    puts "==============================================="
    puts @order
    puts Cart.first.id
    orders =  Cart.first.orders
    orders.each do |o|
      puts o.id
      puts "========="
    end

  #  if Cart.all.count == nil
  #    @cart = Cart.create()
  #    @order = Order.create(cart_id:@cart.id, realrelease_id:@realrelease.id)
  #  else
  #    @cart=Cart.first
  #    if @cart.orders.include? @order
  #      @order.quantity += 1
  #    else
  ##      @order = Order.create(cart_id:@cart.id, realrelease_id:@realrelease.id)
  #    end



  end

  private

  def order_params
    params.require(:order).permit(:realrelease_id, :cart_id)
  end
end
