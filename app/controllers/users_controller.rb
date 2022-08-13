class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]
  before_action :set_user, only: [:likes]

  def show
    @user = User.find(params[:id])
    @destinations = @user.destinations.all.order(created_at: :desc).page(params[:page]).per(8)
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to destinations_path
  end

  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:destination_id)
    @favorite_destinations = Destination.find(favorites)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :introduction, :nationality, :profile_image)
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

end
