class HomeController < ApplicationController

  def index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
    if user_signed_in?
      if current_user.admin?
        redirect_to admin_path
      elsif current_user.hostel_owner?
        redirect_to hostel_owner_index_path
      elsif current_user.hostel_seeker?
        redirect_to hostel_seeker_index_path
      end
    end
  end
 end
