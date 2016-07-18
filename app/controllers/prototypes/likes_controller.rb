class Prototypes::LikesController < ApplicationController
  before_action :set_prototype, only: [:create, :destroy]

  def create
    @prototype.likes.create(like_params)
  end

  def destroy
    @prototype.likes.find_by(prototype_id: params[:prototype_id], user_id: current_user).destroy
    @prototype.reload
  end

  private
  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end

  def like_params
    params.permit(
            prototype_id: params[:prototype_id]).merge(user_id: current_user.id)
  end
end
