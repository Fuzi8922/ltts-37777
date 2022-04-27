class Review < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :price_range
  belongs_to :evaluation

  with_options presence: true do
    validates :item
    validates :image
    validates :review_text
    validates :price_range_id
    validates :category_id
    validates :evaluation_id
  end

end
