class FavouritesController < ApplicationController
  before_action :fav_item, only: [:index, :create, :destroy]

  def index
    @favourite = Favourite.where(user_id: current_user.id)
  end

  def create
    @favourite = Favourite.new(
      user_id: current_user.id, 
      item_id: @item.id
    )
    @favourite.save
  end

  def destroy
    @favourite = Favourite.find_by(
      user_id: current_user.id, 
      item_id: @item.id
    )
    @favourite.destroy
  end
  def fav_item
    @item = Item.find(params[:item_id])
  end
end
