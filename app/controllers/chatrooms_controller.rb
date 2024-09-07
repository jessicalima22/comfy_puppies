class ChatroomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_animal

  def index
    @chatrooms = policy_scope(Chatroom)
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize @chatroom
  end

  def new

    @chatroom = Chatroom.new
    authorize @chatroom
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    @chatroom.animal = @animal
    authorize @chatroom
    if @chatroom.save!
      redirect_to animal_chatroom_path(@animal, @chatroom)
    else
      render :new
    end
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end

  def set_animal
    @animal = Animal.find(params[:animal_id])
  end
end
