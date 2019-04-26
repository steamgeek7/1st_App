class PaymentsController < ApplicationController
  def create
    @token = params[:stripeToken]
    @product = params[:product_id]
    @user = current_user
  # Create the charge on Stripe's servers - this will charge the user's card
  begin
    charge = Stripe::Charge.create(
      amount: 5000, # amount in cents, again
      currency: "usd",
      source: token,
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

end
  redirect_to product_path(@product)
end
