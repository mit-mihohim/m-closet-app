class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer       :season,   null: false, default: 0
      t.integer       :color,    null: false, default: 0
      t.string        :text
      t.references    :category, null: false, foreign_key: true
      t.references    :user,     null: false, foreign_key: true
      t.timestamps
    end
  end
end


# class ItemsController < ApplicationController
#   before_action :move_to_root_path, except: :index, unless: :user_signed_in?
#   before_action :get_parents_categories, only: [:new]
#   before_action :set_item, only: [:show]

#   def index
#   end

#   def new
#     @item = Item.new
#   end

#   def create
#     @item = Item.new(item_params)
#     if @item.save
#       redirect_to root_path, notice: "アイテムが登録されました"
#     else
#       redirect_to new_item_path, alert: "アイテム登録に失敗しました"
#     end
#   end

#   def show
    
#   end

#   private
#   def move_to_root_path
#     redirect_to root_path, alert: "ログインしてください"
#   end
#   def item_params
#     params.require(:item).permit(:image, :season, :color, :text, :category_id, :user_id)
#   end

#   def set_item
#     @item = Item.find(params[:id])
#   end
# end
