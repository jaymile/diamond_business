class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @attendances = Attendance.all
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Utilisateur modifié!"
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:primary] = "Cet utilisateur a bien été supprimé."
      redirect_to admin_users_path
      return
    else
    end
  end

  def require_admin
    unless current_user.is_admin
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :description, :email, :is_admin)
  end
end