class Order < ApplicationRecord
  belongs_to :user
  has_many :assignment, dependent: :destroy
  has_many :products, through: :assignment
end
