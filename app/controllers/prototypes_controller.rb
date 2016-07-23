class PrototypesController < ApplicationController

  before_action :set_prototype, except: [:index, :new, :create]

  def index
    @prototypes = Prototype.includes(:user).order('created_at DESC')
  end

  def show
    @images = @prototype.images
    @user = @prototype.user
    @comments = @prototype.comments.includes(:prototype)
    @comment = @prototype.comments.new(prototype_id: @prototype.id) if user_signed_in?
  end

  def new
    @prototype = Prototype.new
    @prototype.images.build
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path, notice: '投稿完了しました'
    else
      flash.now[:alert] = "投稿失敗しました"
      render :new
    end
  end

  private
  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      images_attributes: [:id, :image, :role, :prototype_id]
      ).merge(user_id: current_user.id,  tag_list: params[:prototype][:tag])
  end
end

