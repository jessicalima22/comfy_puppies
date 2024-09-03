class ChatroomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @animal = Animal.find(params[:animal_id])
    @chatrooms = policy_scope(Chatroom)
    authorize @chatrooms
    # @chatrooms = Chatroom.all
  end

  def show
    @animal = Animal.find(params[:animal_id])
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize @chatroom
  end

  def new
    @animal = Animal.find(params[:animal_id])
    @chatroom = Chatroom.new
    authorize @chatroom
  end

  def create
    @animal = Animal.find(params[:animal_id])
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
end
