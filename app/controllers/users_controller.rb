class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update]
before_action :authenticate_user!, only: [:show, :edit, :update]

  def show
    @prototypes = @user.prototypes.includes(:tags).page(params[:id]).per(5)
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to root_path, notice: "編集完了しました"
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :member, :profile, :works)
  end
end

