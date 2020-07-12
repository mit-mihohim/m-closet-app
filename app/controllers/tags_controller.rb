class TagsController < ApplicationController
  before_action :force_json, only: :search
  def index
    @tags_all = ActsAsTaggableOn::Tag.all
    @popular_tags = ActsAsTaggableOn::Tag.most_used(6)
  end

  def search
    @tags = ActsAsTaggableOn::Tag.named_like(params[:keyword]).limit(5)
  end

  private
  def force_json
    request.format = :json
  end
end
