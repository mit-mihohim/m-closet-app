class StylingsController < ApplicationController
  def index

  end

  def show
    
  end

  def new
    @styling = Styling.new
  end

  def create
    @styling = Styling.new(styling_params)
    if @styling.save
      redirect_to @styling, notice: "スタイリングが登録されました"
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private

  def styling_params
    params.require(:styling).permit(:title, :season, :scene, :text, item_ids: []).merge(user_id: current_user.id)
  end
end
