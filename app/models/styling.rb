class Styling < ApplicationRecord
  belongs_to :user
  has_many :item_stylings
  has_many :items, through: :item_stylings

  validates :title, presence: true
end
