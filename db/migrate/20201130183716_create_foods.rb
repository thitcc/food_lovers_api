class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
