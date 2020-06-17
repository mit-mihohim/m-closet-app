class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.string :ancestry, index: true
    end
    add_index :categories, :name
  end
end
