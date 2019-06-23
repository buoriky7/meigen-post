class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]
  def index
    @user = User.page(params[:page]).per(100).reverse_order
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @word = @user.words.page(params[:page]).per(100).reverse_order
    @words = @user.words.all
  end


  def edit
    @user = User.find(params[:id])
  end

  def delete_confirmation
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "OK"
       redirect_to user_path(@user.id)
    else
      flash[:notice] = "NG"
      render action: :edit
    end
  end



  def new
  end
  def destroy
    @user = User.find(params[:id])
    user = User.find(params[:id])
      if current_user.user_flag == 1
        user.destroy
        redirect_to '/users'
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
  		:email,
      :user_flag)

  end

  def correct_user
    user = User.find(params[:id])
    if current_user.id == user.id
    elsif current_user.user_flag == 1
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
