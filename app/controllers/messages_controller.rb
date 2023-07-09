class MessagesController < ApplicationController
  def index
    @messages = Messages.new
    @room = Room.find(parms(:room_id))
  end

  def create
    @room = Room.find(prams[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else 
      render :index
    end
  end

  private
  def message_params
    message.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end
