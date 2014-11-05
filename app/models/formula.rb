class Formula < ActiveRecord::Base
  attr_accessible :descripcion, :nombre, :tiempo, :tipo
  has_many :portions
  has_many :ingredients , through: :portions

  accepts_nested_attributes_for :portions
  attr_accessible :portions_attributes
end
