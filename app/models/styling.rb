class Styling < ApplicationRecord
  belongs_to :user
  has_many :item_stylings
  has_many :items, through: :item_stylings

  validates :title, :season, :scene, presence: true
end
