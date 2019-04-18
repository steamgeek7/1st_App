if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV[''],
    secret_key: ENV['']
  }
else
  Rails.configuration.stripe = {
    publishable_key: '',
    secret_key: ''
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
