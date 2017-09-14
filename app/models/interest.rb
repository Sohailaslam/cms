class Interest < ActiveRecord::Base
    belongs_to :visitor
    belongs_to :product
end
