class ProductSerializer < ActiveModel::Serializer
  attributes :id, :description, :price, :image_url
end
