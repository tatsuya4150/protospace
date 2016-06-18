class PrototypesController < ApplicationController
  def index
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
      render :new
    end
  end

  private
  def prototype_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      images_attributes: [:id, :image, :role, :prototype_id]
      )
  end
end
