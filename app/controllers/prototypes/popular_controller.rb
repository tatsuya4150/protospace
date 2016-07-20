class Prototypes::PopularController < ApplicationController
  def index
    @prototypes = Prototype.eager_load(:user).order('likes_count DESC')
  end
end
