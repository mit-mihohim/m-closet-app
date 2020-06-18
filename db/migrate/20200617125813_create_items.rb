class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string        :image,    null: false
      t.integer       :season,   null: false, default: 0
      t.integer       :color,    null: false, default: 0
      t.string        :text
      t.references    :category, null: false, foreign_key: true
      t.references    :user,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
