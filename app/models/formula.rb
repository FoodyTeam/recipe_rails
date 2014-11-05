class Formula < ActiveRecord::Base
  has_many :portions
  has_many :ingredients , through: :portions

  accepts_nested_attributes_for :portions
end
