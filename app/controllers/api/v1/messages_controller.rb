class Api::V1::MessagesController < ApplicationController
  def create
    # to = params[:message][:to]
    # body = params[:message][:body]

    #testing
    # current_user = User.first 

    message = current_user.messages.create(message_params)
    if message.persisted?
      twilio_message = TWILIO_CLIENT.messages.create(
        body: message.body,
        to: message.to,
        from: ENV.fetch('TWILIO_PHONE_NUMBER')  
      )
      render json: { message: "Message created" }, status: :created
    else
      render json: { errors: message.errors.full_messages }, status: :unprocessable_entity
    end

  end

  def index
    messages = current_user.messages.order_by(created_at: :desc)
    render json: messages, status: :ok
  end

  def message_params
    params.require(:message).permit(:to, :body)
  end
end
