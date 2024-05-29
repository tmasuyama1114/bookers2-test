class ChatsController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @chat = current_user.chats.new(chat_params)
    @chat.room_id = @room.id
    @chat.save
    redirect_to room_path(@room)
  end

  private

  def chat_params
    params.require(:chat).permit(:message)
  end
end
