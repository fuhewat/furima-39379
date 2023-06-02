class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :articles

  validates :title, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :send_area_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :sender_day_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true, numericality: { greater_than: 299, less_than: 10000000, message: "should be between 300 and 9999999"  }
  validates :image, presence: true
end
