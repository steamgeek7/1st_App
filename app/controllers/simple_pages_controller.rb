class SimplePagesController < ApplicationController
  def index
    @products = Product.limit(3)
  end
  def contact
  end
  def about
  end
  def landing_page
    @products = Product.limit(3)
  end
  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end
end
