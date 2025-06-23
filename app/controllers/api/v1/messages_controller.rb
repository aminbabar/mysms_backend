class Api::V1::MessagesController < ApplicationController
  def create
    message = current_user.messages.build(message_params)
    if message.save
      begin
        SmsSender.new(message).call
        render json: message, serializer: MessageSerializer, status: :created
      rescue SmsSender::DeliveryError => e
        message.destroy
        render json: { errors: ['SMS delivery failed. Please try again later.'] },
               status: :bad_gateway
      end
    else
      render json: { errors: message.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    messages = current_user.messages.order_by(created_at: :desc)
    render json: messages, each_serializer: MessageSerializer
  end

  def message_params
    params.require(:message).permit(:to, :body)
  end
end
