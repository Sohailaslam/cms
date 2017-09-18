class Product < ActiveRecord::Base
    scope :sorted, -> { order(:name) }
    has_many :interest
    has_many :visitors, :through => :interest
end
