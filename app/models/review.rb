class Review < ApplicationRecord

  has_many :comments
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :price_range
  belongs_to :evaluation

  validates :item, length: { maximum: 50 }
  validates :review_text, length: { minimum: 10, maximum: 1000 }

  with_options presence: true do
    validates :item
    validates :image
    validates :review_text
    validates :price_range_id
    validates :category_id
    validates :evaluation_id
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :price_range_id
    validates :category_id
    validates :evaluation_id
  end

end
