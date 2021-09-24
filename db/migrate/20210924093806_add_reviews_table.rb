class AddReviewsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :comment

      # Adding indexes to relations is something to take into account when modeling
      # a database. Indexes let DB engines optimize the queries we do
      t.belongs_to :product, index: true

      t.timestamps
    end
  end
end
