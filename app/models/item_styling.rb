class ItemStyling < ApplicationRecord
  belongs_to :item
  belongs_to :styling
  validates :item_id, presence: true
  validates :styling_id, presence: true
end
