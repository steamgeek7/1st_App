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
  def get_hits
    hits = $redis.get('hit_counter')
    if !hits
      hits = $redis.getset('hit_counter', 0)
    end
    return hits
  end
end
