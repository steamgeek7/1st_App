if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['pk_live_nPI0VbuSsyjaAPwWsbXqq9oK00gUbbmE4H'],
    secret_key: ENV['sk_live_6NfHxfaDbU2LRM7xAD9tjOkg00DOfi7Tbf']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_nPI0VbuSsyjaAPwWsbXqq9oK00gUbbmE4H',
    secret_key: 'sk_test_6NfHxfaDbU2LRM7xAD9tjOkg00DOfi7Tbf'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
