class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :region_id, :municipality, :number, :building, :telephone, :token

  with_options presence: true do
    validates :user_id
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/}
    validates :municipality
    validates :number
    validates :telephone, format: { with: /\A\d{10,11}\z/}
    validates :token
    validates :item_id
  end
  validates :region_id, numericality: { other_than: 1 }
  


  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, region_id: region_id, municipality: municipality, number: number, building: building, telephone: telephone, order_id: order.id)
  end
end