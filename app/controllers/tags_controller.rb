class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def create
    
  end
end
