class CreateItemStylings < ActiveRecord::Migration[6.0]
  def change
    create_table :item_stylings do |t|
      t.references    :item,        null: false, foreign_key: true
      t.references    :styling,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
