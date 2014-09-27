class Departement < ActiveRecord::Base
  has_many :incidents
end
