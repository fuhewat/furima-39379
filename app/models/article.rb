class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :send_area
  belongs_to :sender_day

  validates :title, :text, presence: true
 
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_charge, numericality: { other_than: 1 , message: "can't be blank"}
  validates :send_area, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :sender_day, numericality: { other_than: 1 , message: "can't be blank"}
 

end
