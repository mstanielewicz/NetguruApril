class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :price

  def average_rating
    if self.reviews.size > 0
      self.reviews.average(:rating)
    else
      0
    end
  end
end
