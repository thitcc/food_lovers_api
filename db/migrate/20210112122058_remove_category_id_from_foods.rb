class RemoveCategoryIdFromFoods < ActiveRecord::Migration[6.0]
  def change
    remove_column :foods, :category_id
  end
end
