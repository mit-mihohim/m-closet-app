class TagsController < ApplicationController
  before_action :force_json, only: :search
  def index
    @tags_all = ActsAsTaggableOn::Tag.all
  end

  def search
    @tags = ActsAsTaggableOn::Tag.named_like(params[:keyword]).limit(5)
  end

  private
  def force_json
    request.format = :json
  end
end
