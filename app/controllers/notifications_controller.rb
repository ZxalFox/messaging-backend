class NotificationsController < ApplicationController
  def create
    message = { type: "notification", text: params[:message] }
    $redis.publish("notifications", message.to_json)
    render json: { status: "sent", message: message }
  end
end
