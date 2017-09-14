class Product < ActiveRecord::Base
    
    has_many :interest
    has_many :visitor, :through => :interest
end
