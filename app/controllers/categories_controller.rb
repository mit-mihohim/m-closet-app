class CategoriesController < ApplicationController

  def index
    
  end
  
  def children_categories
    @children = Category.find(params[:parentCategory]).children
  end

  def grandchildren_categories
    @grandchildren = Category.find(params[:childCategory]).children
  end

end
