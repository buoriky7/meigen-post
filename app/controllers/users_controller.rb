class UsersController < ApplicationController
  def index
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



  private
  def user_params
  	params.require(:user).permit(
  		:name,
  		:prefecture,
  		:user_gender,
  		:email)

  end
end
