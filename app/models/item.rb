class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one_attached :image, dependent: :destroy
  has_many :stylings, dependent: :destroy
  has_many :stylings, through: :item_stylings

  validates :season, :color, presence: true

  def show_image
    return self.image.variant(combine_options:{resize: "500x500", crop: "500x500", gravity: :center}).processed
  end

  def thumbnail
    return self.image.variant(combine_options:{resize: "200x200", crop: "200x200", gravity: :center}).processed
  end

  enum season: {"春夏": 1, "秋冬": 2, "その他": 3}
  enum color: {"白": 1, "黒": 2, "ベージュ": 3, "紺": 4, "赤": 5, "ピンク": 6, "黄": 7, "緑": 8, "青": 9, "紫": 10, "その他(柄)": 11}
end
