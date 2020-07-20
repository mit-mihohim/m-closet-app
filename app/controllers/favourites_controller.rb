class FavouritesController < ApplicationController
  before_action :fav_item, only: [:create, :destroy]

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

  private
  
  def fav_item
    @item = Item.find(params[:item_id])
  end
end
