class CreateJoinTableFoodsCategories < ActiveRecord::Migration[6.0]
  def change
    create_join_table :foods, :categories do |t|
      # t.index [:food_id, :category_id]
      # t.index [:category_id, :food_id]
    end
  end
end
