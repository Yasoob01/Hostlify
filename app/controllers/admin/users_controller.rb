class Admin::UsersController < ApplicationController
  load_and_authorize_resource
    def index
      Rails.logger = Logger.new(STDOUT)
      Rails.logger.level = Logger::DEBUG
      Rails.logger.info params[:users_grid]
      @users_grid = Admin::UsersGrid.new
    end

    def edit

    end

    def update

    end


    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to admin_users_path, status: :see_other
    end
  end
