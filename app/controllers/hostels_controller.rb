class HostelsController < ApplicationController
  load_and_authorize_resource
  def index
    unless current_user.present? and current_user.hostel_owner?
      render test
    end
    @hostels = current_user.hostels
  end

  def show
    @hostel = Hostel.find(params[:id])
  end

  def new
    @hostel = Hostel.new
  end

  def create
    @hostel = current_user.hostels.build(hostel_params)
    if @hostel.save
      redirect_to hostel_path(@hostel)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @hostel = Hostel.find(params[:id])
  end

  def update
    @hostel = Hostel.find(params[:id])
    if @hostel.update(hostel_params)
      redirect_to @hostel
    else
      render :edit, status: :unprocessable_entity
    end

  end

  def destroy
    @hostel  = Hostel.find(params[:id])
    @hostel.destroy

    redirect_to hostels_path, status: :see_other
  end

  private
  def hostel_params
    params.require(:hostel).permit(:name, :location, :rooms_available, :images => [])
  end

end

