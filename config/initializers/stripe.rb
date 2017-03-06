# Stripe.api_key = "sk_test_LyAAyqsyWdzAmLHHq40vjVcf"
# STRIPE_PUBLIC_KEY = "pk_test_pGiHgqJwVH68zHewVlPGjkUX"

Rails.configuration.stripe = {
    :publishable_key => Rails.application.secrets.stripe_publishable_key,
    :secret_key      => Rails.application.secrets.stripe_secret_key
}

Stripe.api_key = Rails.application.secrets.stripe_secret_key