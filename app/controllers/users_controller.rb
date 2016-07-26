class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @prototypes = @user.prototypes.includes(:tags)
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to root_path, notice: "編集完了しました"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :member, :profile, :works)
  end
end

