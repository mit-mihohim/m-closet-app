class ItemStyling < ApplicationRecord
  belongs_to :items
  belongs_to :stylings
  validates :items_id, presence: true
  validates :styling_id, presence: true
end
