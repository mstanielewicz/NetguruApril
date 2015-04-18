class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :price
  validates_format_of :price, :with => /\A[0-9]+([.][0-9]{1,2})\z/

  def average_rating
    if self.reviews.size > 0
      self.reviews.average(:rating).to_f
    else
      0
    end
  end
end
