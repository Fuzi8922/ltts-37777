class Review < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :item
    validates :image
    validates :review_text
    validates :price_range_id
    validates :category_id
    validates :evaluation_id
  end

end
