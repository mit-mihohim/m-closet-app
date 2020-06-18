class ItemsController < ApplicationController
  def index
  end

  private

  def item_params
    params.require(:item).permit(:image, :season, :color, :text, :category_id, :user_id)
  end
end
