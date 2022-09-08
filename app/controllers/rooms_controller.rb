class RoomsController < ApplicationController
  def index
    @rooms = Room.where(hostel_id: params[:hostel_id])

  end

  def new
    @hostel = Hostel.find(params[:hostel_id])
    @room = @hostel.rooms.build
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to hostel_room_path(@room.hostel, @room)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def edit
    @room = Room.find(params[:id])
    @hostel = @room.hostel
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to hostel_room_path(@room.hostel, @room)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @hostel_id = @room.hostel_id
    if @room.destroy
      redirect_to hostel_rooms_path(@hostel_id)
    else
      render plain: "Error in delete"
    end

  end

  def room_params
    params.require(:room).permit(:airconditioned, :wifi, :tv, :attached_bath, :fridge, :room_capacity, :hostel_id)
  end
end