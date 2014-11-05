class Ingredient < ActiveRecord::Base
  has_many :portions
  has_many :formulas , through: :portions
end
