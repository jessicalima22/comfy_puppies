class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  after_create_commit { broadcast_message }

  private

  def broadcast_message
    ActionCable.server.broadcast "chatroom_#{chatroom_id}_channel", message: content, user: user.name
  end
end
