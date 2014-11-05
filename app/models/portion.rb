class Portion < ActiveRecord::Base
  belongs_to :formula
  belongs_to :ingredient
end
