class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :difficulty, :name
  has_many :signups
end
