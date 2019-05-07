class PaymentsController < ApplicationController
  def create
    @token = params[:stripeToken]
    @product = Product.find(params[:product_id])
    @user = current_user
    begin
      charge = Stripe::Charge.create(
        amount: 5000, # amount in cents, again
        currency: "usd",
        source: @token,
        description: params[:stripeEmail]
      )
      if charge.paid
        Order.create(
          user: @user,
          product: @product,
          total: @product.price
        )
      end
    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end

    redirect_to payments_thank_you_path(product_id: @product.id)
  end

  def thank_you
    @product = Product.find(params[:product_id])
  end
end
