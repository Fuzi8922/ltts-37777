class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string     :item,           null: false
      t.text       :review_text,    null: false
      t.integer    :price_range_id, null: false
      t.integer    :category_id,    null: false
      t.integer    :evaluation_id,  null: false
      t.references :user,           null: false, foreign_key: true

      t.timestamps
    end
  end
end
