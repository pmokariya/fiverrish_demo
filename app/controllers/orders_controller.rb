class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    amount = params[:stripeAmount].to_i * 100
    service = Service.find(params[:service_id])
    # Create the customer in Stripe
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      card: params[:stripeToken]
    )
    # Create the charge using the customer data returned by Stripe API
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: amount,
      description: 'Rails Stripe customer',
      currency: 'usd'
    )
    order = current_user.orders.new(order_params)
    order.total_price = order.price.to_i * order.quantity.to_i
    order.save!
    redirect_to root_path
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to service_path(service)
    flash[:notice] = "Please try again"
    # TODO: Create a new order for the spcified user/service.
    # Redirect to an appropriate page if save fails.
  end

  def user_orders
    @orders = current_user.orders.order(created_at: :desc)
  end

  private
  def order_params
    params.require(:order).permit!
  end
end
