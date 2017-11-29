class Product < ApplicationRecord
  has_many :assignment, dependent: :destroy
end
