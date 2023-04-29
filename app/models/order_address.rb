class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :region_id, :municipality, :number, :building, :telephone, :token, :order_id

  with_options presence: true do
    validates :user_id
    validates :post_code
    validates :region_id
    validates :municipality
    validates :number
    validates :building
    validates :telephone
    validates :token
    validates :item_id
    # validates :order_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, region_id: region_id, municipality: municipality, number: number, building: building, telephone: telephone, order_id: order.id)
  end
end