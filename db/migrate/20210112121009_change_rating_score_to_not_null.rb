class ChangeRatingScoreToNotNull < ActiveRecord::Migration[6.0]
  def change
    change_column :ratings, :score, :integer, null: false
  end
end
