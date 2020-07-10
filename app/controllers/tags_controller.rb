class TagsController < ApplicationController
  def index
    @tags_all = ActsAsTaggableOn::Tag.all
  end

  def search
    @tags = ActsAsTaggableOn::Tag.named_like(params[:keyword]).limit(5)
    respond_to do |format|
      format.html
      format.json
    end
  end
end
