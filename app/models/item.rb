class Item < ApplicationRecord
  belongs_to :user
  # has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :postage
  belongs_to_active_hash :region
  belongs_to_active_hash :schedule

  validates :name, presence: true, length: {maximum: 40}
  validates :explanation, presence: true, length: {maximum: 1000}
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :postage_id, presence: true
  validates :region_id, presence: true
  validates :schedule_id, presence: true
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }
  validates :image, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "catn't be blank"}
  validates :status_id, numericality: { other_than: 1 , message: "catn't be blank"}
  validates :postage_id, numericality: { other_than: 1 , message: "catn't be blank"}
  validates :region_id, numericality: { other_than: 1 , message: "catn't be blank"}
  validates :schedule_id, numericality: { other_than: 1 , message: "catn't be blank"}
end
