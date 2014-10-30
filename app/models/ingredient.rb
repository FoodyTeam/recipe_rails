class Ingredient < ActiveRecord::Base
  attr_accessible :nombre

has_many :portions
has_many :formulas , through: :portions

end
