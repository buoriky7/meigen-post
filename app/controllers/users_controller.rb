class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]
  def index
    @user = User.all

  end

  def show
    @user = User.find(params[:id])
    @word = @user.words



  end

  def edit
  end

  def delete_confirmation
  end

  def new
  end
  def destroy
    @user = User.find(params[:id])
    user = User.find(params[:id])
      if current_user.user_flag == 1
        user.destroy
        redirect_to action: '/users'
      else
        user.destroy
        redirect_to '/'
      end
  end


  private
  def user_params
  	params.require(:user).permit(
  		:name,
  		:prefecture,
  		:user_gender,
  		:email)

  end
end
