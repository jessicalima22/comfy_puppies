class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chatroom_#{params[:chatroom_id]}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    chatroom = Chatroom.find(params[:chatroom_id])
    chatroom.messages.create!(content: data['message'], user: current_user)
  end
end
