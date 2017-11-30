class OrderSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :email, :phone_number, :amount, :status
  has_many :assignment
  has_many :products, through: :assignment
end
