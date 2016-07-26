class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_prototype, except: [:index, :new, :create]

  def index
    @prototypes = Prototype.includes(:user, :tags).order('created_at DESC').page(params[:page]).per(4)
  end

  def show
    @images = @prototype.images
    @user = @prototype.user
    @comments = @prototype.comments.includes(:user)
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

  def edit
    @sub_images = @prototype.images.sub[0]
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to root_path, notice: '編集完了しました。'
    else
      flash.now[:alert] = "編集失敗しました。"
      render :edit
    end
  end

  def destroy
    if @prototype.user_id == current_user.id
      @prototype.destroy
      redirect_to root_path, notice: '削除完了しました。'
    else
      flash.now[:alert] = "削除失敗しました。"
      render :show
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
      ).merge(user_id: current_user.id, tag_list: params[:prototype][:tag])
  end
end

