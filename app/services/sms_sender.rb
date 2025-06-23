class SmsSender
  class DeliveryError < StandardError; end

  def initialize(message)
    @message = message
    @from    = ENV.fetch('TWILIO_PHONE_NUMBER')
  end


  def call
    twilio_client.messages.create(
      body: @message.body,
      to:   @message.to,
      from: @from
    )
    true
  rescue Twilio::REST::RestError => e
    raise DeliveryError, e.message
  end

  private

  def twilio_client
    @twilio_client ||= Twilio::REST::Client.new(
      ENV.fetch('TWILIO_ACCOUNT_SID'),
      ENV.fetch('TWILIO_AUTH_TOKEN')
    )
  end
end
