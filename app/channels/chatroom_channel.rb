class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    chatroom = Chatroom.find(params[:id])
    stream_for chatroom
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # def speak(data)
  #   chatroom = Chatroom.find(params[:chatroom_id])
  #   chatroom.messages.create!(content: data['message'], user: current_user)
  # end
end
