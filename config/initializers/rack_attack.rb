class Rack::Attack
  throttle('req/ip', limit: 60, period: 60) do |req|
    req.ip
  end
end