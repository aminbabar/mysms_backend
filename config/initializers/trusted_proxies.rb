Rails.application.config.action_dispatch.trusted_proxies = [
  IPAddr.new('0.0.0.0/0')  # for all IPs. change later. 
]