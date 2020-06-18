class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  enum season: {"春夏": 1, "秋冬": 2, "その他": 3}
  enum color: {"白": 1, "黒": 2, "赤": 3, "ピンク": 4, "黄": 5, "緑": 6, "青": 7, "紫": 8, "その他(柄)": 9}
end
