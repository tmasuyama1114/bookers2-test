class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    @chats = @room.chats
    @chat = Chat.new
  end

  def create
    @room = Room.new
    if @room.save
      @user_room1 = UserRoom.create(room_id: @room.id, user_id: current_user.id)
      @user_room2 = UserRoom.create(room_id: @room.id, user_id: params[:user_id])
      redirect_to room_path(@room)
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
