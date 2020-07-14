class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :return_to_root_path, except: :top, unless: :user_signed_in?
  before_action :fav_new, only: [:index, :show]
  before_action :items_all, only: [:index, :unfavourites]
  before_action :fav_items, only: [:favourites, :unfavourites]

  def index
    if params[:tag_name]
      @items = @items.tagged_with(params[:tag_name])
      @tag = params[:tag_name]
    end
  end

  def show
  end

  def new
    @item = Item.new
    @tags = ActsAsTaggableOn::Tag.all
    @popular_tags = ActsAsTaggableOn::Tag.most_used(6)
  end

  def edit
  end

  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'アイテムが登録されました' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'アイテムの編集が完了しました' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item.destroy
    @item.image.purge
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'アイテムが削除されました' }
      format.json { head :no_content }
    end
  end

  def top
    if user_signed_in?
      @items = current_user.items
      @favourites = Favourite.where(user_id: current_user.id)
    end
  end

  def favourites
    if @fav.present?
      render template: "items/index"
    else
      redirect_to items_path, alert: "お気に入りがありません。お気に入りを見つけよう！"
    end
  end

  def unfavourites
    @unfav = @items - @fav
    if @unfav.present?
      render template: "items/index"
    else
      render :index, notice: "いじけ服はありません！みんな大活躍！！"
    end
  end


  private

  def return_to_root_path
    redirect_to root_path, alert: "ログインが必要です"
  end

  def item_params
    params.require(:item).permit(:image, :season, :color, :text, :tag_list).merge(user_id: current_user.id)
  end

  def fav_new
    @fav = Favourite.new
  end

  def items_all
    @items = current_user.items.with_attached_image.includes([:image_attachment])
  end

  def fav_items
    @fav = current_user.items.joins(:favourites)
  end
end
