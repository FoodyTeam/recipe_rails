class Formula < ActiveRecord::Base
  has_many :portions
  has_many :ingredients , through: :portions
   include ArelHelpers::ArelTable

  accepts_nested_attributes_for :portions
end
