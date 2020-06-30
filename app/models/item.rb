class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image, dependent: :destroy
  has_many :item_tags, dependent: :destroy
  has_many :tags, through: :item_tags, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :favourite, through: :favourites, source: :user

  validates :image, :tags, :season, :color, presence: true

  enum season: {"春夏": 1, "秋冬": 2, "その他": 3}
  enum color: {"白": 1, "黒": 2, "ベージュ": 3, "紺": 4, "赤": 5, "ピンク": 6, "黄": 7, "緑": 8, "青": 9, "紫": 10, "その他(柄)": 11}
end
