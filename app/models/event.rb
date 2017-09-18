class Event < ActiveRecord::Base
    enum event_type: [ :conference, :exhibition, :meeting, :training, :demo, :deployment ]
    
    has_many :assigned_event
    has_many :users, :through => :assigned_event
    has_many :visitor
end
