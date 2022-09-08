class HostelOwnerController < ApplicationController
  load_and_authorize_resource :User
  def index
  end

  def show
    @hostel_owner = User.find(params[:id])
  end

  def edit
    @hostel_owner = User.find(params[:id])
  end

  def update
    @hostel_owner = User.find(params[:id])
    if @hostel_owner.update(hostel_owner_params)
      redirect_to hostel_owner_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @hostel_owner = User.find(params[:id])
    if @hostel_owner.destroy
      render plain: "Deleted"
    else
      render plain: "Can not be deleted"
    end

  end

  def hostel_owner_params
    params.require(:user).permit(:name, :phone, :email)
  end

end
