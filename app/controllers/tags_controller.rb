class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all
    respond_to do |format|
      format.html
      format.json
    end
  end
end
