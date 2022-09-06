class HostelSeekerController < ApplicationController
  def index
    @hostel_seeker = current_user
    @hostels = Hostel.all
  end

  def edit
    @hostel_seeker = User.find(params[:id])
  end

  def update
    @hostel_seeker = User.find(params[:id])
    if @hostel_seeker.update(hostel_seeker_params)
      redirect_to hostel_seeker_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @hostel_seeker = User.find(params[:id])
  end
  def hostel_seeker_params
    params.require(:user).permit(:name, :phone, :email)
  end
end

