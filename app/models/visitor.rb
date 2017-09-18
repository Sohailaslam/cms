class Visitor < ActiveRecord::Base
    has_many :interest
    has_many :products, :through => :interest
    
    belongs_to :user
    belongs_to :event
    
    def self.search(user)
        if !user.nil?
            where(user_id: user)
        else
            all
        end
    end
end
