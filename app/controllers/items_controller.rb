class ItemsController < ApplicationController
  before_action :move_to_root_path, except: :index, unless: :user_signed_in?

  def index
  end

  def new
    @item = Item.new
  end

  private

  def item_params
    params.require(:item).permit(:image, :season, :color, :text, :category_id, :user_id)
  end
end
