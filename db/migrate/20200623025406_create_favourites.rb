class CreateFavourites < ActiveRecord::Migration[6.0]
  def change
    create_table :favourites do |t|
      t.references :item, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
    end
  end
end
