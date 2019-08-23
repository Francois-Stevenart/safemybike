class OrdersController < ApplicationController
  def create
    booking = Booking.find(params[:booking_id])
    order = Order.create!(amount: booking.price, state: 'pending', user: current_user, booking: booking)

    redirect_to new_order_payment_path(order)
  end

  def show
    @order = current_user.orders.where(state: 'paid').find(params[:id])
  end
end
