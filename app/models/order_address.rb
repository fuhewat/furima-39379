class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :send_municipalities, :send_area_id, :send_address_number, :tel_number, :building_name, :item_id,
                :user_id, :token

  with_options presence: true do
    validates :token
    validates :item_id
    validates :user_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :send_municipalities
    validates :send_address_number
    validates :tel_number, length: { in: 10..11 }, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width numbers' }
  end
  validates :send_area_id, numericality: { other_than: 1, message: 'Select' }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, send_municipalities: send_municipalities, send_address_number: send_address_number,
                   send_area_id: send_area_id, building_name: building_name, tel_number: tel_number, order_id: order.id)
  end
end
