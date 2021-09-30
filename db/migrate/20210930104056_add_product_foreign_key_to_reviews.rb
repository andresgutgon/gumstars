class AddProductForeignKeyToReviews < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :reviews, :products, column: :product_id,  on_delete: :cascade
  end
end
