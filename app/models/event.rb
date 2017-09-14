class Event < ActiveRecord::Base
    enum event_type: [ :conference, :exhibition, :meeting, :training, :demo, :deployment ]
    
    belongs_to :user
    has_many :visitor
end
