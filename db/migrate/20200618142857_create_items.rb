class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer       :season,   null: false, default: 0
      t.integer       :color,    null: false, default: 0
      t.string        :text
      t.references    :user,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
