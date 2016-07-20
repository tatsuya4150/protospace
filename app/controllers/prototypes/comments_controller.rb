class Prototypes::CommentsController < ApplicationController

  before_action :set_prototype, only: :create

  def create
    @prototype.comments.create(comment_params)
    @comments = @prototype.comments
  end

  private
  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end

  def comment_params
    params.require(:comment).permit(:id, :text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

end
