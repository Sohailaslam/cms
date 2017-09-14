class Visitor < ActiveRecord::Base
    has_many :interest
    has_many :products, :through => :interest
    
    belongs_to :user
    belongs_to :event
    
    
end
