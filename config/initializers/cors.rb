# require 'rack'
# require 'rack/cors'
require_relative '../environment'
# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'austinbh.github.io', 'pokedex-yeet.herokuapp.com'

    resource '/v1/teams/*',
      headers: :any,
      methods: [:get, :post, :delete]
    resource '/v1/trainers/*',
      headers: :any,
      methods: [:get, :post, :patch, :delete]
    resource 'v1/pokemon/*',
      headers: :any,
      methods: :get
    resource 'v2/pokemon/*',
      headers: :any,
      methods: :get
  end

  allow do
    origins '*'

    resource '*',
      headers: :any,
      methods: :get
  end
end
