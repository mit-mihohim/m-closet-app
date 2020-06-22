class Tag < ApplicationRecord
  has_many :item_tags, dependent: :destroy
  has_many :tags, through: :item_tags, dependent: :destroy
end
