class User < ApplicationRecord

  has_one_attached :image
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :goods, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_format_of :birthday, with: /\A\d{4}-\d{2}-\d{2}\z/

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'must be alphanumeric characters'

  with_options presence: true do
    validates :nickname
    validates :birthday
  end

  def good_by?(review_id)
    goods.where(review_id: review_id).exists?
  end

  def bookmark_by?(review_id)
    bookmarks.where(review_id: review_id).exists?
  end

end
