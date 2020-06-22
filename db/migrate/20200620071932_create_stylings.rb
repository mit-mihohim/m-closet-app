class CreateStylings < ActiveRecord::Migration[6.0]
  def change
    create_table :stylings do |t|
      t.string         :title,  null: false
      t.integer        :season, null: false, default: 0
      t.string         :scene
      t.string         :text
      t.references     :user,   null: false, foreign_key: true
      t.timestamps
    end
  end
end
