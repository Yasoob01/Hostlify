class HostelSeekerController < ApplicationController
  def index
    @hostel_seeker = current_user
    @hostels = nil
    if params[:search]
      query_string = ""
      search = params[:search]
      location = search[:location]

      #@hostels = Hostel.search(location).results

      ac = search[:airconditioned]
      fridge = search[:fridge]
      tv = search[:tv]
      combine = ""
      if location
        query_string = query_string+"hostels.location like '%#{location}%'"
        combine = "and"
      end
      if ac
        query_string = query_string+combine+"rooms.airconditioned = '1'"
      end

      if fridge
        query_string = query_string+combine+"rooms.fridge = '1'"
      end

      if tv
        query_string = query_string+combine+"rooms.tv = '1'"
      end


      @hostels = Hostel.joins(:rooms).where(query_string).distinct

    else
      @hostels = Hostel.all
    end
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

