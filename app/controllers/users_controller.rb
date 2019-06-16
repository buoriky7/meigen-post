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
    @user = User.find(params[:id])
  end

  def delete_confirmation
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:success] = "ユーザー情報を編集しました。"
       redirect_to user_path(@user.id)
    else
      flash[:danger] = "編集に失敗しました..."
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

  def correct_user
    user = User.find(params[:id])
    if current_user.id == user.id
    elsif current_user.user_flag == 1
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
