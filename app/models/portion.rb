class Portion < ActiveRecord::Base
  attr_accessible :formula_id, :ingredient_id


  belongs_to :formula
  belongs_to :ingredient
end
