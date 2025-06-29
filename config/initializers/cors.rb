# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin Ajax requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "http://localhost:4200"

    resource "*",
      headers: :any,
      expose:  ['authorization'], 
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end

  allow do
    # Your production Angular frontend domain (change this!)
    origins 'https://mysms-frontend.onrender.com'

    resource '*',
      headers: :any,
      expose:  ['authorization'], 
      methods: [:get, :post, :patch, :put, :delete, :options, :head]
  end
end
