class AssignmentSerializer < ActiveModel::Serializer
  attributes :id
  has_one :order
  has_one :product
end
